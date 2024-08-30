import 'package:flutter/material.dart';
import 'package:movies_app_team/api/api_manager.dart';
import 'package:movies_app_team/colors.dart';
import 'package:movies_app_team/model/MovieDetailsResponse.dart';
import 'package:movies_app_team/movie_details/movie_details_screen.dart';

class DetailsGetApi extends StatelessWidget {
  MovieDetailsResponse movieDetailsResponse = MovieDetailsResponse();
  var movieId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieDetailsResponse?>(
      future: ApiManager.getMovieDetailsResult(movieDetailsResponse as String),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Something Went Wrong!");
        }

        if (snapshot.data!.code == 'false') {
          return Text(snapshot.data!.message!);
        }
        var resultDetailsMovie = snapshot.data!;
        return Column(children: [MovieDetailsScreen()]);
      },
    );
  }
}
