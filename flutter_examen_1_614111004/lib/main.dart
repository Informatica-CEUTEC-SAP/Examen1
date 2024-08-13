import 'package:flutter/material.dart';
import 'package:flutter_examen_1_614111004/menu_principal.dart';
import 'package:flutter_examen_1_614111004/noticias.dart';
import 'package:flutter_examen_1_614111004/lista_tareas.dart';
import 'package:flutter_examen_1_614111004/cambio_moneda.dart';
import 'package:flutter_examen_1_614111004/podcast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Universitario',
      home: MenuPrincipal(),
      routes: {
        '/noticias': (context) => Noticias(),
        '/lista_tareas': (context) => ListaTareas(),
        '/cambio_moneda': (context) => CambioMoneda(),
        '/podcast': (context) => Podcast(),
      },
    );
  }
}