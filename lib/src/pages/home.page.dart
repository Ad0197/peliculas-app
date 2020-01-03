import 'package:flutter/material.dart';

import 'package:peliculas_app/src/components/movie.horizontal.componets.dart';
import 'package:peliculas_app/src/utils/medias.querys.util.dart';
import '../components/card.swiper.components.dart';
import 'package:peliculas_app/src/providers/peliculas.provider.dart';

class HomePage extends StatelessWidget {
  static String pageName = '/';
  final peliculasProvider = PeliculaProvider();

  @override
  Widget build(BuildContext context) {
     // Estas lineas definen el tamaño de la pantalla
    MediaQueryUtils.WIDTH = MediaQuery.of(context).size.width;
    MediaQueryUtils.HEIGHT = MediaQuery.of(context).size.height;
    
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context),
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

  Widget _footer(BuildContext context) => Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget>[
        Container(padding: EdgeInsets.only(left: 20.0),child: Text("Populares", style: Theme.of(context).textTheme.subhead,)),
        SizedBox(height: 5.0,),
        FutureBuilder(
          future: peliculasProvider.getPopular(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            print(snapshot.data);
            return (snapshot.hasData)
            ? MovieHorizontal(peliculas: snapshot.data,)
            : Container(
                  height: 400.0,
                  child: Center(
                  child: CircularProgressIndicator()
                  )
                );
          },
        ),
      ],
    ),
  );
}
