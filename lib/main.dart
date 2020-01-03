import 'package:flutter/material.dart';
 
import 'package:peliculas_app/src/routes/route.dart';
import 'src/utils/medias.querys.util.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: getRoutes,
    );
  }
}