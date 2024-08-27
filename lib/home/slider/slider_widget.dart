import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_team/home/slider/poster_slider.dart';

class SliderWidget extends StatelessWidget {
  var resultList;

  String path = "https://image.tmdb.org/t/p/w500";

  SliderWidget({required this.resultList});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return CarouselSlider.builder(
        itemCount: resultList.length,
        itemBuilder: (context, index, realIndex) {
          String backGround = path + resultList[index].backdropPath ?? "";
          String poster = path + resultList[index].posterPath ?? "";
          return PosterSlider(
            poster: poster,
            backGround: backGround,
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
