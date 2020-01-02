import 'package:flutter/material.dart';
import 'package:peliculas_app/src/models/peliculas.model.dart';
import 'package:peliculas_app/src/providers/peliculas.provider.dart';

import '../components/card.swiper.components.dart';

class HomePage extends StatelessWidget {
  static String pageName = '/';
  final peliculasProvider = PeliculaProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            _swiperTarjetas(),
            _footer(),
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() => FutureBuilder(
        future: peliculasProvider.getEnCines(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          return (snapshot.hasData)
              ? CardSwiper(
                  peliculas: snapshot.data,
                )
              : Container(
                  height: 400.0,
                  child: Center(
                  child: CircularProgressIndicator()
                  )
                );
        },
      );

  Widget _footer() => Container(
    width:
  );
}
