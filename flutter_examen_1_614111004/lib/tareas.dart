import 'package:flutter/material.dart';

class Tareas extends StatefulWidget {
  @override
  _TareasState createState() => _TareasState();
}

class _TareasState extends State<Tareas> {
  List<String> _tareas = [
    'Tarea 1: Entregar proyecto de programación',
    'Tarea 2: Estudiar para el examen de matemáticas',
    'Tarea 3: Realizar ejercicio de física',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: ListView.builder(
        itemCount: _tareas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_tareas[index]),
          );
        },
      ),
    );
  }
}