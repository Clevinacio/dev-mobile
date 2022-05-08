import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tutorial_flutter/components/TarefaForm.dart';
import 'package:tutorial_flutter/components/TarefaLista.dart';

import 'package:tutorial_flutter/models/tarefa.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
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
            Column(
              children: <Widget>[TarefaLista(_tarefas, _removeTarefa)],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => TarefaForm(_novaTarefa),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _novaTarefa(
      String titulo, DateTime data, String observacao, String prioridade) {
    Tarefa novaTarefa = Tarefa(
      id: Random().nextInt(9999).toString(),
      titulo: titulo,
      data: data,
      observacao: observacao,
      prioridade: prioridade,
      criacao: DateTime.now(),
    );

    setState(() {
      _tarefas.add(novaTarefa);
      _tarefas.sort((a, b) => a.data.compareTo(b.data));
    });
  }

  _removeTarefa(String id) {
    setState(() {
      _tarefas.removeWhere((tarefa) => tarefa.id == id);
    });
  }
}
