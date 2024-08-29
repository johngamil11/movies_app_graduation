import 'package:flutter/material.dart';
import 'package:movies_app_team/colors.dart';
import 'package:movies_app_team/search/search_movie_item.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.backgroundNavigator,
          body: SearchMovieItem()),
    );
  }
}
