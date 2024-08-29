import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app_team/model/DiscoverResponse.dart';
import 'package:movies_app_team/model/RecomendedMoviesResponse.dart';

import '../model/GenreResponse.dart';
import '../model/SliderResponse.dart';
import '../model/UpcomingMoviesResponse.dart';
import 'api_constants.dart';

class ApiManager {
  /// todo upcoming api
  static Future<UpcomingMoviesResponse?> getResult() async {
    ///https://api.themoviedb.org/3/movie/upcoming?api_key=062030db387c8f0f3bce376cfb433da8
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.upcomingApi, {
      'api_key': '062030db387c8f0f3bce376cfb433da8',
    });
    var response = await http.get(url);
    // gbt el data mn el server 3shan a3rdha fl application
    return UpcomingMoviesResponse.fromJson(jsonDecode(response.body));
  }

  /// todo recomended api
  static Future<RecomendedMoviesResponse?> getRecomendedResult() async {
    //https://api.themoviedb.org/3/movie/top_rated?api_key=062030db387c8f0f3bce376cfb433da8
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.recomendedApi, {
      'api_key': '062030db387c8f0f3bce376cfb433da8',
    });
    var response = await http.get(url);
    // gbt el data mn el server 3shan a3rdha fl application
    return RecomendedMoviesResponse.fromJson(jsonDecode(response.body));
  }

  // todo slider api
  static Future<SliderResponse?> getSliderResult() async {
    //https://api.themoviedb.org/3/movie/top_rated?api_key=062030db387c8f0f3bce376cfb433da8
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sliderApi, {
      'api_key': '062030db387c8f0f3bce376cfb433da8',
    });
    var response = await http.get(url);
    // gbt el data mn el server 3shan a3rdha fl application
    return SliderResponse.fromJson(jsonDecode(response.body));
  }

  /// todo discover api
  static Future<DiscoverResponse?> getDiscoverResult(String id) async {
//https://api.themoviedb.org/3/discover/movie?api_key=062030db387c8f0f3bce376cfb433da8
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.discoverApi, {
      'api_key': '062030db387c8f0f3bce376cfb433da8',
      'with_genres': id,
    });
    var response = await http.get(url);
    // gbt el data mn el server 3shan a3rdha fl application
    return DiscoverResponse.fromJson(jsonDecode(response.body));
  }

  /// todo category api
  static Future<GenreResponse?> getGenreResult() async {
//https://api.themoviedb.org/3/genre/movie/list?api_key=062030db387c8f0f3bce376cfb433da8
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.genreApi, {
      'api_key': '062030db387c8f0f3bce376cfb433da8',
    });
    var response = await http.get(url);
    // gbt el data mn el server 3shan a3rdha fl application
    return GenreResponse.fromJson(jsonDecode(response.body));
  }
}
