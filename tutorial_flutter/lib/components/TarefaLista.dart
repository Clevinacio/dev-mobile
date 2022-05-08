import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutorial_flutter/models/tarefa.dart';

class TarefaLista extends StatefulWidget {
  final List<Tarefa> _tarefaLista;
  void Function(String) onDelete;

  TarefaLista(this._tarefaLista, this.onDelete);

  @override
  State<TarefaLista> createState() => _TarefaListaState();
}

class _TarefaListaState extends State<TarefaLista> {
  String _filtroSelecionado = 'Data';
  @override
  Widget build(BuildContext context) {
    return widget._tarefaLista.isNotEmpty
        ? Column(
            children: [
              DropdownButton(
                value: _filtroSelecionado,
                items: <String>['Data', 'Prioridade']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  switch (newValue) {
                    case 'Data':
                      widget._tarefaLista
                          .sort((a, b) => a.data.compareTo(b.data));
                      break;
                    default:
                      widget._tarefaLista
                          .sort((a, b) => b.prioridade.compareTo(a.prioridade));
                  }
                  setState(() {
                    _filtroSelecionado = newValue!;
                  });
                },
              ),
              Container(
                height: 400,
                child: ListView.builder(
                  itemCount: widget._tarefaLista.length,
                  itemBuilder: (context, index) {
                    final tarefa = widget._tarefaLista[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('/task-detail', arguments: tarefa);
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: tarefa.data.day >=
                                                    DateTime.now().day &&
                                                tarefa.data.month >=
                                                    DateTime.now().month &&
                                                tarefa.data.year >=
                                                    DateTime.now().year
                                            ? Theme.of(context).primaryColor
                                            : Colors.red),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    DateFormat('d MMM y').format(tarefa.data),
                                    style: TextStyle(
                                        color: tarefa.data.day >=
                                                    DateTime.now().day &&
                                                tarefa.data.month >=
                                                    DateTime.now().month &&
                                                tarefa.data.year >=
                                                    DateTime.now().year
                                            ? Theme.of(context).primaryColor
                                            : Colors.red),
                                  ),
                                ),
                                Expanded(
                                  child: Text(tarefa.titulo),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: tarefa.prioridade == 'baixa'
                                          ? Colors.green
                                          : tarefa.prioridade == 'normal'
                                              ? Colors.yellow
                                              : Colors.red,
                                      border: Border.all(
                                        width: 2,
                                        color: tarefa.prioridade == 'baixa'
                                            ? Colors.green
                                            : tarefa.prioridade == 'normal'
                                                ? Colors.yellow
                                                : Colors.red,
                                      ),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        tarefa.prioridade,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => widget.onDelete(tarefa.id),
                                    color: Colors.black26,
                                  ),
                                  flex: 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        : const Center(
            child: Text("Nenhuma tarefa cadastrada",
                style: TextStyle(
                  fontSize: 22,
                )),
          );
  }
}
