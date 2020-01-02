import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas_app/src/models/peliculas.model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image:NetworkImage(peliculas[index].getPosterImgUrl()),
              placeholder: AssetImage("assets/img/no-image.jpg"), 
              fit: BoxFit.cover,
            )
          );
        },
        itemCount: 3,
        itemHeight: _screenSize.height * 0.5,
        itemWidth: _screenSize.width * 0.7,
        // pagination: new SwiperPagination(),
        layout: SwiperLayout.STACK,
        // control: new SwiperControl(),
      ),
    );
  }
}
