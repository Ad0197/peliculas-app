import 'dart:js';

import 'package:flutter/material.dart';

import 'package:peliculas_app/src/models/peliculas.model.dart';
import '../utils/medias.querys.util.dart';

class MovieHorizontal extends StatelessWidget {
  MovieHorizontal({@required this.peliculas});

  final List<Pelicula> peliculas;
  final double height = MediaQueryUtils.HEIGHT;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.2,
      child: PageView(
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        pageSnapping: false,
        children: _tarjetas(context),
      ),
    );
  }

  List<Widget> _tarjetas(BuildContext context) => peliculas
      .map((pelicula) => 
        Container(
          margin: EdgeInsets.only(right: 15.0),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImgUrl()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: height*0.17,
                ),
              ),
              SizedBox( height: 5.0,),
              Text(
                pelicula.title, 
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ), 
        )
      ).toList();
}