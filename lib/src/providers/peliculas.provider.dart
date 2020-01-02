import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/peliculas.model.dart';

class PeliculaProvider{
  String _apiKey    = 'a660736e6a74427f0c8586b12919307e'; 
  String _url       = 'api.themoviedb.org';
  String _language  = 'es_ES';

  Future<List<Pelicula>>getEnCines() async{
    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key' : _apiKey,
      'language': _language,
    });
    return _extraerPeliculas(url);
  }

  Future<List<Pelicula>> getPopular() async{
    final url = Uri.http(_url, '3/movie/popular', {
      'api_key' : _apiKey,
      'language': _language,
    });
    return _extraerPeliculas(url);
  }

  Future<List<Pelicula>> _extraerPeliculas(Uri url) async{
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final peliculas = Peliculas.fromJsonList(decodeData['results']);
    return peliculas.items;
  }
}