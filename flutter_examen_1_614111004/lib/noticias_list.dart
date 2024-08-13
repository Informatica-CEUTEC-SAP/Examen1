import 'package:flutter/material.dart';

class NoticiasList extends StatefulWidget {
  @override
  _NoticiasListState createState() => _NoticiasListState();
}

class _NoticiasListState extends State<NoticiasList> {
  List<String> _noticias = [
    'Noticia 1: Nuevo curso de programación disponible',
    'Noticia 2: Cambios en el horario de clases',
    'Noticia 3: Evento de networking para estudiantes',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias'),
      ),
      body: ListView.builder(
        itemCount: _noticias.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_noticias[index]),
            ),
          );
        },
      ),
    );
  }
}