import 'package:flutter/material.dart';

class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage3> {
  late double _imc = 0;
  final GlobalKey<FormState> _formValidatorKey = GlobalKey<FormState>();

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  void _calcularIMC() {
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text) / 100;
    double imc = peso / (altura * altura);

    setState(() {
      _imc = imc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMCalc'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formValidatorKey,
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: pesoController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Peso',
                      helperText: 'Use . para o separador.\nEx: 65.8',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira seu peso!";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: alturaController,
                    decoration: const InputDecoration(
                      labelText: 'Altura',
                      helperText: 'Use apenas números.\nEx: 176',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira sua altura!";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formValidatorKey.currentState!.validate()) {
                        _calcularIMC();
                      }
                    },
                    child: const Text('Calcular'),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: resultWidget(_imc),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }

  Widget resultWidget(double imc) {
    String _result = "";
    String _imc = imc.toStringAsPrecision(3);
    Color _color = Colors.transparent;
    String _img = 'abaixo.png';

    if (imc == 0) {
    } else if (isAbaixo(imc)) {
      _result = "$_imc\nAbaixo do Peso";
      _color = Colors.blue;
    } else if (isNormal(imc)) {
      _result = "$_imc\nPeso Normal";
      _color = Colors.green;
      _img = 'normal.png';
    } else if (isSobrePeso(imc)) {
      _result = "$_imc\nSobrepeso";
      _color = Colors.yellow;
      _img = 'sobrepeso.png';
    } else if (isObesidadeI(imc)) {
      _result = "$_imc\nObesidade Grau I";
      _color = const Color.fromARGB(255, 161, 132, 0);
      _img = 'obesidade_grau_I.png';
    } else if (isObesidadeII(imc)) {
      _result = "$_imc\nObesidade Grau II";
      _color = Colors.orange;
      _img = 'obesidade_grau_II.png';
    } else if (isObesidadeIII(imc)) {
      _result = "$_imc\nObesidade Grau III";
      _img = 'obesidade_grau_III.png';
      _color = Colors.red;
    } else {
      _result = "Valor inválido";
      _color = Colors.blue;
    }

    return Center(
        child: Column(
      children: <Widget>[
        Text(
          _result,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: _color,
          ),
        ),
        Image.asset(
          _img,
          color: _color,
          width: 150,
        ),
      ],
    ));
  }
}

isAbaixo(imc) {
  return imc < 18.5;
}

isNormal(imc) {
  return imc >= 18.5 && imc < 25;
}

isSobrePeso(imc) {
  return imc >= 25 && imc < 30;
}

isObesidadeI(imc) {
  return imc >= 30 && imc < 35;
}

isObesidadeII(imc) {
  return imc >= 35 && imc < 40;
}

isObesidadeIII(imc) {
  return imc >= 40;
}
