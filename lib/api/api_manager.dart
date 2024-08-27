import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app_team/model/RecomendedMoviesResponse.dart';

import '../model/SliderResponse.dart';
import '../model/UpcomingMoviesResponse.dart';
import 'api_constants.dart';

class ApiManager {
  static Future<UpcomingMoviesResponse?> getResult() async {
    ///https://api.themoviedb.org/3/movie/upcoming?api_key=062030db387c8f0f3bce376cfb433da8
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.upcomingApi, {
      'api_key': '062030db387c8f0f3bce376cfb433da8',
    });
    var response = await http.get(url);
    // gbt el data mn el server 3shan a3rdha fl application
    return UpcomingMoviesResponse.fromJson(jsonDecode(response.body));
  }

  static Future<RecomendedMoviesResponse?> getRecomendedResult() async {
    //https://api.themoviedb.org/3/movie/top_rated?api_key=062030db387c8f0f3bce376cfb433da8
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.recomendedApi, {
      'api_key': '062030db387c8f0f3bce376cfb433da8',
    });
    var response = await http.get(url);
    // gbt el data mn el server 3shan a3rdha fl application
    return RecomendedMoviesResponse.fromJson(jsonDecode(response.body));
  }

  static Future<SliderResponse?> getSliderResult() async {
    //https://api.themoviedb.org/3/movie/top_rated?api_key=062030db387c8f0f3bce376cfb433da8
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sliderApi, {
      'api_key': '062030db387c8f0f3bce376cfb433da8',
    });
    var response = await http.get(url);
    // gbt el data mn el server 3shan a3rdha fl application
    return SliderResponse.fromJson(jsonDecode(response.body));
  }

  /// todo movie detail api
//   static Future<SliderResponse?> getMovieDetailsResult(String movieId) async {
// //https://api.themoviedb.org/3/movie/278?api_key=062030db387c8f0f3bce376cfb433da8
//     Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.movieDetailsApi+movieId, {
//       'api_key': '062030db387c8f0f3bce376cfb433da8',
//     });
//     var response = await http.get(url);
//     // gbt el data mn el server 3shan a3rdha fl application.
//     return SliderResponse.fromJson(jsonDecode(response.body));
//   }
}
