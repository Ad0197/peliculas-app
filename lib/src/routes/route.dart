import 'package:flutter/material.dart';

import 'package:peliculas_app/src/pages/home.page.dart';

Map<String, Widget Function (BuildContext)> getRoutes = {
  HomePage.pageName : (BuildContext context) => HomePage(),
};