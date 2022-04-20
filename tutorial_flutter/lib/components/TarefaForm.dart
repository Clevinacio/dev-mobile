import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TarefaForm extends StatefulWidget {
  void Function(String, DateTime) onSubmit;

  TarefaForm(this.onSubmit);

  @override
  State<StatefulWidget> createState() => _TarefaFormState();
}

class _TarefaFormState extends State<TarefaForm> {
  final _tarefaController = TextEditingController();
  DateTime _dataSelecionada = DateTime.now();

  _submitForm() {
    final titulo = _tarefaController.text;

    if (titulo.isEmpty) {
      return;
    }

    widget.onSubmit(titulo, _dataSelecionada);
  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2023))
        .then((pickedDate) {
      setState(() {
        _dataSelecionada = pickedDate!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        controller: _tarefaController,
        decoration: const InputDecoration(labelText: 'Tarefa'),
      ),
      Row(
        children: [
          Text(
              'Data selecionada - ${DateFormat('d MMM y').format(_dataSelecionada)}'),
          TextButton(onPressed: _showDatePicker, child: Text('Selecionar data'))
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
    ]);
  }
}
