import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_team/home/recomended/recomended_widget.dart';
import 'package:movies_app_team/home/slider/poster_slider.dart';
import 'package:movies_app_team/model/MovieDetailsResponse.dart';
import 'package:movies_app_team/movie_details/movie_details_screen.dart';

class SliderWidget extends StatelessWidget {
  var resultList;

  String path = "https://image.tmdb.org/t/p/w500";
  String? name;

  String? overFlow;

  String? backdropPath;

  double? voteAverage;

  String? posterPath;

  String? releaseDate;

  int? id;
  SliderWidget({required this.resultList});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return CarouselSlider.builder(
        itemCount: resultList.length,
        itemBuilder: (context, index, realIndex) {
          String backGround = path + resultList[index].backdropPath ?? "";
          String poster = path + resultList[index].posterPath ?? "";
          return InkWell(
            onTap: () {
              MovieDetailsResponse movieDetails = MovieDetailsResponse();
              name = resultList[index].title ?? '';
              name = resultList[index].title ?? '';
              backdropPath = resultList[index].backdropPath ?? '';
              overFlow = resultList[index].overview ?? '';
              voteAverage = resultList[index].voteAverage ?? '';
              posterPath = resultList[index].posterPath ?? '';
              releaseDate = resultList[index].releaseDate ?? '';
              id = resultList[index].id ?? '';
              // results = resultList[index];
              Navigator.of(context).pushNamed(MovieDetailsScreen.routeName,
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
            },
            child: PosterSlider(
              title: resultList[index].title ?? '',
              year: resultList[index].releaseDate ?? '',
              poster: poster,
              backGround: backGround,
            ),
          );
        },
        options: CarouselOptions(
          //0.32 original height
          height: height * 0.5,

          pauseAutoPlayOnTouch: true,

          // aspectRatio: 16 / 9,
          viewportFraction: 1,

          initialPage: 0,
          enableInfiniteScroll: true,

          reverse: false,

          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.6,
          scrollDirection: Axis.horizontal,
        ));
  }
}
