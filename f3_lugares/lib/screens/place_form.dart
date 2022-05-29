import 'package:f3_lugares/data/my_data.dart';
import 'package:f3_lugares/models/country.dart';
import 'package:f3_lugares/models/place.dart';
import 'package:f3_lugares/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../components/main_drawer.dart';
import '../components/place_item.dart';
import '../models/favoritos.dart';
import '../models/places.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({Key? key}) : super(key: key);

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _countries = DUMMY_COUNTRIES
      .map((country) => MultiSelectItem(country, country.title))
      .toList();

  List _countriesSelected = [];

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _imageUrlController = TextEditingController();
    final TextEditingController _evaluationController = TextEditingController();
    final TextEditingController _averagePriceController =
        TextEditingController();
    final TextEditingController _recommendationController =
        TextEditingController();
    var _placesList = context.watch<Places>();

    _submitForm() {
      if (_formKey.currentState!.validate()) {
        List<String> _countriesIds = [];
        List<String> _recommendationsIds =
            _recommendationController.text.split(',');

        for (var country in _countriesSelected) {
          _countriesIds.add(country.id);
        }

        final Place place = Place(
          id: 'p${DUMMY_PLACES.length + 1}',
          paises: _countriesIds,
          titulo: _titleController.text,
          imagemUrl: _imageUrlController.text,
          recomendacoes: _recommendationsIds,
          avaliacao: double.parse(_evaluationController.text),
          custoMedio: double.parse(_averagePriceController.text),
        );

        _placesList.addPlace(place);

        Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Lugar criado com sucesso!'),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Criar lugar')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
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
                    labelText: 'Recomendações (separe por virgula)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, preencha pelo menos uma recomendação';
                  }

                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('Salvar'),
                    onPressed: _submitForm,
                  ),
                  TextButton(
                    child: const Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.HOME);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
