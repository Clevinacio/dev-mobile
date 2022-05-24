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

  List<Country> _selectedCountries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar lugar')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome do lugar'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, preencha o nome do lugar';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              MultiSelectBottomSheetField<Country>(
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
                  _selectedCountries = values;
                },
                chipDisplay: MultiSelectChipDisplay(
                  onTap: (value) {
                    setState(() {
                      _selectedCountries.remove(value);
                    });
                  },
                ),
              ),
              TextFormField(
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
              const Text('Recomenções'), // TODO - Recomendações
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, preencha pelo menos uma recomendação';
                  }

                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.HOME);
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Salvar'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final favoritos =
                            Provider.of<Favoritos>(context, listen: false);

                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.HOME);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Lugar criado com sucesso!'),
                          ),
                        );
                      }
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
