import 'package:flutter/material.dart';
import 'package:movies_app_team/home/new_releases/poster_widget.dart';
import 'package:movies_app_team/home/recomended/recomended_widget.dart';
import 'package:movies_app_team/movie_details/movie_details_screen.dart';

import '../../colors.dart';
import '../../model/MovieDetailsResponse.dart';

class NewReleasesWidget extends StatelessWidget {
  var resultList;
  String? name;

  String? overFlow;

  String? backdropPath;

  double? voteAverage;

  String? posterPath;

  String? releaseDate;

  int? id;

  MovieDetailsResponse movieDetails = MovieDetailsResponse();
  String path = "https://image.tmdb.org/t/p/w500";
  RecomendedWidget? recomendedWidget;

  NewReleasesWidget({required this.resultList});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.25,
      color: AppColor.widgetBackground,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "New Releases 🔥",
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
                    name = resultList[index].title ?? '';
                    backdropPath = resultList[index].backdropPath ?? '';
                    overFlow = resultList[index].overview ?? '';
                    voteAverage = resultList[index].voteAverage ?? '';
                    posterPath = resultList[index].posterPath ?? '';
                    releaseDate = resultList[index].releaseDate ?? '';
                    id = resultList[index].id ?? '';
                    Navigator.of(context)
                        .pushNamed(MovieDetailsScreen.routeName,
                            arguments: RecomamendedWidgetArgus(
                              id: id!,
                              movieDetails: movieDetails,
                              releaseDate: releaseDate,
                              name: name.toString(),
                              backdropPath: backdropPath.toString(),
                              overFlow: overFlow.toString(),
                              posterPath: posterPath.toString(),
                              voteAverage: voteAverage,
                            ));

                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(
                    //     name: path + resultList[index].,
                    //   )));
                    // /// navigator to movie details screen
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    child: PosterWidget(
                        poster: path + resultList[index].posterPath ?? ""),
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
