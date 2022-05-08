import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TarefaForm extends StatefulWidget {
  void Function(String, DateTime, String, String) onSubmit;

  TarefaForm(this.onSubmit);

  @override
  State<StatefulWidget> createState() => _TarefaFormState();
}

class _TarefaFormState extends State<TarefaForm> {
  final _tituloController = TextEditingController();
  final _observacaoController = TextEditingController();

  final List _prioridades = <String>['baixa', 'normal', 'alta'];
  String _prioridadeSelecionada = 'normal';
  DateTime _dataSelecionada = DateTime.now();

  _submitForm() {
    final titulo = _tituloController.text;
    final observacao = _observacaoController.text;
    final prioridade = _prioridadeSelecionada;
    if (titulo.isEmpty || observacao.isEmpty) {
      return;
    }

    widget.onSubmit(titulo, _dataSelecionada, observacao, prioridade);
    Navigator.pop(context);
  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.utc(2020, 1, 1),
            firstDate: DateTime.utc(2020, 1, 1),
            lastDate: DateTime(2023))
        .then((pickedDate) {
      setState(() {
        _dataSelecionada = pickedDate!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Criar nova tarefa'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _tituloController,
                      decoration: const InputDecoration(labelText: 'Tarefa'),
                    ),
                    flex: 3,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButton(
                      value: _prioridadeSelecionada,
                      items: _prioridades
                          .map(
                            (prioridade) => DropdownMenuItem(
                              child: Text(prioridade),
                              value: "$prioridade",
                            ),
                          )
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _prioridadeSelecionada = newValue!;
                        });
                      },
                    ),
                    flex: 1,
                  ),
                ],
              ),
              TextField(
                controller: _observacaoController,
                decoration: const InputDecoration(labelText: 'Observação'),
              ),
              Row(
                children: [
                  Text(
                      'Data selecionada - ${DateFormat('d MMM y').format(_dataSelecionada)}'),
                  TextButton(
                    onPressed: _showDatePicker,
                    child: const Text('Selecionar data'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: _submitForm, child: const Text('Confirmar')),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                controller: _tituloController,
                decoration: const InputDecoration(labelText: 'Tarefa'),
              ),
              flex: 3,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: DropdownButton(
                value: _prioridadeSelecionada,
                items: _prioridades
                    .map(
                      (prioridade) => DropdownMenuItem(
                        child: Text(prioridade),
                        value: "$prioridade",
                      ),
                    )
                    .toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _prioridadeSelecionada = newValue!;
                  });
                },
              ),
              flex: 1,
            ),
          ],
        ),
        TextField(
          controller: _observacaoController,
          decoration: const InputDecoration(labelText: 'Observação'),
        ),
        Row(
          children: [
            Text(
                'Data selecionada - ${DateFormat('d MMM y').format(_dataSelecionada)}'),
            TextButton(
              onPressed: _showDatePicker,
              child: const Text('Selecionar data'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: _submitForm, child: const Text('Confirmar')),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
