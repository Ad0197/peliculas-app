import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../models/peliculas.model.dart';

class PeliculaProvider{
  String _apiKey    = 'a660736e6a74427f0c8586b12919307e'; 
  String _url       = 'api.themoviedb.org';
  String _language  = 'es_ES';
  int _popularPage  = 0;

  List<Pelicula> _populares = List();
  final _popularesStream = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get populareSink => _popularesStream.sink.add;
  Stream<List<Pelicula>> get populareStream => _popularesStream.stream;

  void diposed() => _popularesStream?.close();

  Future<List<Pelicula>>getEnCines() async{
    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key' : _apiKey,
      'language': _language,
    });
    return await _extraerPeliculas(url);
  }

  Future<List<Pelicula>> getPopular() async{
    _popularPage ++;
    final url = Uri.http(_url, '3/movie/popular', {
      'api_key' : _apiKey,
      'language': _language,
      'page' : _popularPage.toString()
    });
    final resp = await _extraerPeliculas(url);
    _populares..addAll(resp);
    populareSink(_populares);
    return _populares;
  }

  Future<List<Pelicula>> _extraerPeliculas(Uri url) async{
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final peliculas = Peliculas.fromJsonList(decodeData['results']);
    return peliculas.items;
  }
}