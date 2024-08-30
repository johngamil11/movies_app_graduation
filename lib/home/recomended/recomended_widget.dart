import 'package:flutter/material.dart';
import 'package:movies_app_team/home/recomended/poster_recomended_widget.dart';
import 'package:movies_app_team/model/MovieDetailsResponse.dart';

import '../../colors.dart';
import '../../movie_details/movie_details_screen.dart';

class RecomendedWidget extends StatelessWidget {
  var resultList;
  var resultDetailsMovie;
  String? name;

  String? overFlow;

  String? backdropPath;

  double? voteAverage;

  String? posterPath;

  String? releaseDate;

  int? id;

  String widgetTitle;

  MovieDetailsResponse movieDetails = MovieDetailsResponse();

  // Results results = Results();
  String path = "https://image.tmdb.org/t/p/w500";

  RecomendedWidget({required this.resultList, required this.widgetTitle});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.44,
      color: AppColor.widgetBackground,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widgetTitle,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // MovieDetailsResponse movieDetailsResponse ;
                    name = resultList[index].title ?? '';
                    name = resultList[index].title ?? '';
                    backdropPath = resultList[index].backdropPath ?? '';
                    overFlow = resultList[index].overview ?? '';
                    voteAverage = resultList[index].voteAverage ?? '';
                    posterPath = resultList[index].posterPath ?? '';
                    releaseDate = resultList[index].releaseDate ?? '';
                    id = resultList[index].id ?? '';
                    // results = resultList[index];
                    Navigator.of(context)
                        .pushNamed(MovieDetailsScreen.routeName,
                            arguments: RecomamendedWidgetArgus(
                              id: id!,
                              movieDetails: movieDetails,
                              releaseDate: releaseDate,
                              // results: results,
                              name: name.toString(),
                              backdropPath: backdropPath.toString(),
                              overFlow: overFlow.toString(),
                              posterPath: posterPath.toString(),
                              voteAverage: voteAverage,
                            ));

                    // Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(
                    //
                    // )));
                    //
                    // /// navigator to movie details screen
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    child: PosterRecomendedWidget(
                      poster: path + resultList[index].posterPath ?? "",
                      rating: resultList[index].voteAverage,
                      movieName: resultList[index].title,
                      time: resultList[index].releaseDate,
                    ),
                  ),
                );
              },
              itemCount: resultList.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}

class RecomamendedWidgetArgus {
  // MovieDetailsResponse movieDetailsResponse ;
  String name;

  double? voteAverage;

  String? backdropPath;

  String? posterPath;

  String? overFlow;

  String? releaseDate;

  MovieDetailsResponse movieDetails = MovieDetailsResponse();
  int id;

  // Results results = Results();

  // String rate ;
  // String posterPath ;

  RecomamendedWidgetArgus(
      {required this.name,
      required this.movieDetails,
      required this.voteAverage,
      required this.backdropPath,
      required this.overFlow,
      // required this.results,
      // required this.rate,
      required this.posterPath,
      required this.releaseDate,
      required this.id});
}
