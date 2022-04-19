import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:tutorial_flutter/models/tarefa.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final _tarefaController = TextEditingController();
  final List<Tarefa> _tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _tarefaController,
              decoration: const InputDecoration(labelText: 'Tarefa'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: _novaTarefa, child: const Text('Confirmar')),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: _tarefas.length,
                    itemBuilder: (context, index) {
                      final tarefa = _tarefas[index];
                      return Card(
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color:
                                          tarefa.data.day == DateTime.now().day
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context)
                                                  .secondaryHeaderColor),
                                ),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                    DateFormat('d MMM y').format(tarefa.data),
                                    style: TextStyle(
                                        color: tarefa.data.day ==
                                                DateTime.now().day
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context)
                                                .secondaryHeaderColor))),
                            Text(tarefa.titulo),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _novaTarefa() {
    final titulo = _tarefaController.text;

    if (titulo.isEmpty) {
      return;
    }

    Tarefa novaTarefa = Tarefa(
        id: Random().nextInt(9999).toString(),
        titulo: titulo,
        data: DateTime.now());

    setState(() {
      _tarefas.add(novaTarefa);
    });
  }
}
