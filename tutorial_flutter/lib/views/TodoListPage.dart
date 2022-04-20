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
            TarefaForm(_novaTarefa),
            Column(
              children: <Widget>[TarefaLista(_tarefas)],
            )
          ],
        ),
      ),
    );
  }

  void _novaTarefa(String titulo, DateTime data) {
    Tarefa novaTarefa = Tarefa(
        id: Random().nextInt(9999).toString(), titulo: titulo, data: data);

    setState(() {
      _tarefas.add(novaTarefa);
    });
  }
}
