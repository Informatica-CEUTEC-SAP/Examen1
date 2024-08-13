import 'package:flutter/material.dart';

class CambioMoneda extends StatefulWidget {
  @override
  _CambioMonedaState createState() => _CambioMonedaState();
}

class _CambioMonedaState extends State<CambioMoneda> {
  final _formKey = GlobalKey<FormState>();
  String _monedaOrigen = 'USD';
  String _monedaDestino = 'HNL';
  double _monto = 0.0;
  double _resultado = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cambio de Moneda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              DropdownButtonFormField(
                value: _monedaOrigen,
                onChanged: (value) {
                  setState(() {
                    _monedaOrigen = value;
                  });
                },
                items: [
                  DropdownMenuItem(
                    child: Text('USD'),
                    value: 'USD',
                  ),
                  DropdownMenuItem(
                    child: Text('EUR'),
                    value: 'EUR',
                  ),
                ],
              ),
              DropdownButtonFormField(
                value: _monedaDestino,
                onChanged: (value) {
                  setState(() {
                    _monedaDestino = value;
                  });
                },
                items: [
                  DropdownMenuItem(
                    child: Text('HNL'),
                    value: 'HNL',
                  ),
                  DropdownMenuItem(
                    child: Text('USD'),
                    value: 'USD',
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Monto'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Ingrese un monto';
                  }
                  return null;
                },
                onSaved: (value) => _monto = double.parse(value),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _calcularCambio();
                  }
                },
                child: Text('Calcular'),
              ),
              Text(
                'Resultado: ${_resultado.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }

    Map<String, double> _conversiónMoneda = {
  'USD_HNL': 24.50, // 1 USD = 24.50 HNL
  'EUR_HNL': 28.50, // 1 EUR = 28.50 HNL
  'HNL_USD': 0.040, // 1 HNL = 0.040 USD
  'HNL_EUR': 0.035, // 1 HNL = 0.035 EUR
  'USD_EUR': 0.88, // 1 USD = 0.88 EUR
  'EUR_USD': 1.13, // 1 EUR = 1.13 USD
};

  void _calcularCambio() {
  String key = '${_monedaOrigen}_${_monedaDestino}';
  double tasaCambio = _conversiónMoneda[key];

  if (tasaCambio != null) {
    _resultado = _monto * tasaCambio;
  } else {
    _resultado = 0.0;
  }

  setState(() {});
}

}