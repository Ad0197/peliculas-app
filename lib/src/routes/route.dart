import 'package:flutter/material.dart';

import 'package:peliculas_app/src/pages/home.page.dart';
import 'package:peliculas_app/src/pages/pelicula.detalles.dart';

Map<String, Widget Function (BuildContext)> getRoutes = {
  HomePage.pageName : (BuildContext context) => HomePage(),
  PeliculaDetalle.pageName : (BuildContext context) => PeliculaDetalle(),
};