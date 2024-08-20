import 'dart:convert';

import 'package:http/http.dart' as http;

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
}
