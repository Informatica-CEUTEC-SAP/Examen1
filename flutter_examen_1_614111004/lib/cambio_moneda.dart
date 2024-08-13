import 'package:flutter/material.dart';

class CambioMoneda extends StatefulWidget {
  @override
  _CambioMonedaState createState() => _CambioMonedaState();
}

class _CambioMonedaState extends State<CambioMoneda> {
  final _formKey = GlobalKey<FormState>();
  String _monedaOrigen = 'Lempiras';
  String _monedaDestino = 'Dólar';
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
                    child: Text('Lempiras'),
                    value: 'Lempiras',
                  ),
                  DropdownMenuItem(
                    child: Text('Dólar'),
                    value: 'Dólar',
                  ),
                  DropdownMenuItem(
                    child: Text('Euro'),
                    value: 'Euro',
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
                    child: Text('Lempiras'),
                    value: 'Lempiras',
                  ),
                  DropdownMenuItem(
                    child: Text('Dólar'),
                    value: 'Dólar',
                  ),
                  DropdownMenuItem(
                    child: Text('Euro'),
                    value: 'Euro',
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Monto',
                ),
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
                    _calcularCambioMoneda();
                  }
                },
                child: Text('Calcular'),
              ),
              SizedBox(height: 20),
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

  void _calcularCambioMoneda() {
    if (_monedaOrigen == 'Lempiras' && _monedaDestino == 'Dólar') {
      _resultado = _monto / 24.5;
    } else if (_monedaOrigen == 'Lempiras' && _monedaDestino == 'Euro') {
      _resultado = _monto / 28.5;
    } else if (_monedaOrigen == 'Dólar' && _monedaDestino == 'Lempiras') {
      _resultado = _monto * 24.5;
    } else if (_monedaOrigen == 'Dólar' && _monedaDestino == 'Euro') {
      _resultado = _monto * 0.84;
    } else if (_monedaOrigen == 'Euro' && _monedaDestino == 'Lempiras') {
      _resultado = _monto * 28.5;
    } else if (_monedaOrigen == 'Euro' && _monedaDestino == 'Dólar') {
      _resultado = _monto / 0.84;
    }
    setState(() {});
  }
}