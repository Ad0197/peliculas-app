import 'package:flutter/material.dart';
import 'package:peliculas_app/src/models/peliculas.model.dart';

class PeliculaDetalle extends StatelessWidget {
  static String pageName = "/pageDetail";

  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(pelicula),
        ],
      ),
    );
  }
}

Widget _crearAppBar(Pelicula pelicula) {
}
