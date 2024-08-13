import 'package:flutter/material.dart';

class ListaTareas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Tarea ${index + 1}'),
              subtitle: Text('Descripción de la tarea ${index + 1}'),
              trailing: Icon(Icons.check_circle),
            ),
          );
        },
      ),
    );
  }
}