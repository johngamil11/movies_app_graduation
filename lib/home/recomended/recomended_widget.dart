import 'package:flutter/material.dart';
import 'package:movies_app_team/home/new_releases/poster_widget.dart';

class RecomendedWidget extends StatelessWidget {
  String poster;

  RecomendedWidget({required this.poster});

  @override
  Widget build(BuildContext context) {
    return PosterWidget(poster: poster);
  }
}
