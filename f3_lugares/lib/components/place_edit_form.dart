import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../data/my_data.dart';
import '../models/place.dart';
import '../models/places.dart';
import '../utils/app_routes.dart';

class EditPlaceForm extends StatefulWidget {
  final Place _place;

  EditPlaceForm(this._place);

  @override
  State<EditPlaceForm> createState() => _EditPlaceFormState();
}

class _EditPlaceFormState extends State<EditPlaceForm> {
  final _formKey = GlobalKey<FormState>();

  final _countries = DUMMY_COUNTRIES
      .map((country) => MultiSelectItem(country, country.title))
      .toList();

  @override
  Widget build(BuildContext context) {
    Place _place = widget._place;
    List _countriesSelected = DUMMY_COUNTRIES
        .where((country) => _place.paises.contains(country.id))
        .toList();
    final TextEditingController _titleController =
        TextEditingController(text: _place.titulo);
    final TextEditingController _imageUrlController =
        TextEditingController(text: _place.imagemUrl);
    final TextEditingController _evaluationController =
        TextEditingController(text: _place.avaliacao.toString());
    final TextEditingController _averagePriceController =
        TextEditingController(text: _place.custoMedio.toString());
    final TextEditingController _recommendationController =
        TextEditingController(text: _place.recomendacoes.join(','));
    var _placesList = context.watch<Places>();

    _updatePlace() {
      if (_formKey.currentState!.validate()) {
        List<String> _countriesIds = [];
        List<String> _recommendationsIds =
            _recommendationController.text.split(',');

        for (var country in _countriesSelected) {
          _countriesIds.add(country.id);
        }

        final Place place = Place(
          id: _place.id,
          paises: _countriesIds,
          titulo: _titleController.text,
          imagemUrl: _imageUrlController.text,
          recomendacoes: _recommendationsIds,
          avaliacao: double.parse(_evaluationController.text),
          custoMedio: double.parse(_averagePriceController.text),
        );

        _placesList.removePlace(_place);
        _placesList.addPlace(place);

        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Lugar criado com sucesso!'),
          ),
        );
      }
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Nome do lugar'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, preencha o nome do lugar';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            MultiSelectBottomSheetField(
              initialChildSize: 0.4,
              listType: MultiSelectListType.CHIP,
              searchable: true,
              buttonText: const Text("Selecione um ou mais países"),
              title: const Text("País"),
              items: _countries,
              initialValue: _countriesSelected,
              validator: (values) {
                if (values == null || values.isEmpty) {
                  return 'Por favor, selecione pelo menos um país';
                }
                return null;
              },
              onConfirm: (values) {
                _countriesSelected = values;
              },
              chipDisplay: MultiSelectChipDisplay(
                onTap: (value) {
                  setState(
                    () {
                      _countriesSelected.remove(value);
                    },
                  );
                },
              ),
            ),
            TextFormField(
              controller: _imageUrlController,
              decoration:
                  const InputDecoration(labelText: 'Link da foto do local'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, preencha o link da foto do local';
                }

                bool _validURL = Uri.parse(value).isAbsolute;

                if (!_validURL) {
                  return 'Por favor, preencha um link válido';
                }

                return null;
              },
            ),
            TextFormField(
              controller: _evaluationController,
              decoration: const InputDecoration(labelText: 'Avaliação'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, preencha o valor da avaliação';
                }

                if (double.tryParse(value) == null) {
                  return 'Esse campo exige um número decimal';
                }

                return null;
              },
            ),
            TextFormField(
              controller: _averagePriceController,
              decoration: const InputDecoration(labelText: 'Custo médio'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, preencha o valor do custo';
                }

                if (double.tryParse(value) == null) {
                  return 'Esse campo exige um número decimal';
                }

                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _recommendationController,
              decoration: const InputDecoration(
                  labelText: 'Recomendação (separar por virgula)'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, preencha a recomendação';
                }

                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Salvar'),
                  onPressed: () => _updatePlace(),
                ),
                TextButton(
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
