import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutorial_flutter/models/tarefa.dart';

class TaskDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tarefa = ModalRoute.of(context)?.settings.arguments as Tarefa;

    return Scaffold(
      appBar: AppBar(
        title: Text(tarefa.titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Prazo: ' + DateFormat('d MMM y').format(tarefa.data),
                    style: TextStyle(
                        color: tarefa.data.day >= DateTime.now().day &&
                                tarefa.data.month >= DateTime.now().month &&
                                tarefa.data.year >= DateTime.now().year
                            ? Theme.of(context).primaryColor
                            : Colors.red,
                        fontSize: 20),
                  ),
                  flex: 3,
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
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
            Text("Observações:\n${tarefa.observacao}",
                style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
