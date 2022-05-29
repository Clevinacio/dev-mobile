import 'package:f3_lugares/components/main_drawer.dart';
import 'package:f3_lugares/components/place_edit_form.dart';
import 'package:f3_lugares/models/places.dart';
import 'package:f3_lugares/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../data/my_data.dart';
import '../models/place.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _placesList = context.watch<Places>();

    return Scaffold(
      appBar: AppBar(title: Text('Gerenciar Lugares')),
      body: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _placesList.allPlaces.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.PLACES_DETAIL,
                          arguments: _placesList.allPlaces[index],
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
                        width: 1,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 3,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        _placesList.allPlaces[index].titulo,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit),
                                          color: Colors.black26,
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Editar Lugar'),
                                                  content: EditPlaceForm(
                                                      _placesList
                                                          .allPlaces[index]),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        IconButton(
                                          icon:
                                              const Icon(Icons.delete_forever),
                                          color: Colors.black26,
                                          onPressed: () {
                                            _placesList.removePlace(
                                                _placesList.allPlaces[index]);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Lugar removido com sucesso!'),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}

class PlaceEditForm extends StatefulWidget {
  const PlaceEditForm({Key? key}) : super(key: key);

  @override
  State<PlaceEditForm> createState() => _PlaceEditFormState();
}

class _PlaceEditFormState extends State<PlaceEditForm> {
  final _formKey = GlobalKey<FormState>();

  final _countries = DUMMY_COUNTRIES
      .map((country) => MultiSelectItem(country, country.title))
      .toList();

  @override
  Widget build(BuildContext context) {
    final place = ModalRoute.of(context)?.settings.arguments as Place;

    List _countriesSelected = place.paises;

    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _imageUrlController = TextEditingController();
    final TextEditingController _evaluationController = TextEditingController();
    final TextEditingController _averagePriceController =
        TextEditingController();
    final TextEditingController _recommendationController =
        TextEditingController();
    var _placesList = context.watch<Places>();

    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Stack(
                children: <Widget>[
                  Positioned(
                    right: -40.0,
                    top: -40.0,
                    child: InkResponse(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.close),
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _titleController,
                            decoration: const InputDecoration(
                                labelText: 'Nome do lugar'),
                            initialValue: place.titulo,
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
                            buttonText:
                                const Text("Selecione um ou mais países"),
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
                            decoration: const InputDecoration(
                                labelText: 'Link da foto do local'),
                            initialValue: place.imagemUrl,
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
                            decoration:
                                const InputDecoration(labelText: 'Avaliação'),
                            keyboardType: TextInputType.number,
                            initialValue: place.avaliacao.toString(),
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
                            decoration:
                                const InputDecoration(labelText: 'Custo médio'),
                            keyboardType: TextInputType.number,
                            initialValue: place.custoMedio.toString(),
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
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: place.recomendacoes.length,
                            itemBuilder: (ctx, index) {
                              return TextFormField(
                                controller: _recommendationController,
                                decoration: const InputDecoration(
                                    labelText: 'Recomendação'),
                                initialValue: place.recomendacoes[index],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, preencha a recomendação';
                                  }

                                  return null;
                                },
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ElevatedButton(
                                child: const Text('Salvar'),
                                onPressed: () => {},
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
                ],
              ),
            );
          },
        );
      },
    );
  }
}
