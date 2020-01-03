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
  return SliverAppBar(
    elevation: 2.0,
    backgroundColor: Colors.indigo,
    expandedHeight: 200.0,
    floating: false,
    pinned: true,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: Text(
        pelicula.title,
        style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      background: FadeInImage(
          fit: BoxFit.cover,
          image: NetworkImage(pelicula.getBackgroundImgUrl()),
          placeholder: AssetImage('assets/img/loading.gif'),
        ),
    ),
  );
}
