import 'package:flutter/material.dart';
import '../colors.dart';
import 'new_releases/newReleasesWidget.dart';

class HomePage extends StatelessWidget {
  var resultList;
  HomePage({required this.resultList});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      color: AppColor.primaryColor,
      child: SingleChildScrollView(
        child: Column(children: [
          NewReleasesWidget(resultList: resultList),
          SizedBox(
            height: height * 0.03,
          ),
          /// todo new releases movies
          NewReleasesWidget(resultList: resultList),
          SizedBox(
            height: height * 0.03,
          ),
          NewReleasesWidget(resultList: resultList),
        ]),
      ),
    );
  }
}
