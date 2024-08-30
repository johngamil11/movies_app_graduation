import 'package:flutter/material.dart';
import 'package:movies_app_team/home/recomended/recomended_widget.dart';
import 'package:movies_app_team/model/SimillarResponse.dart';

import '../../api/api_manager.dart';
import '../../colors.dart';

class SimillarGetApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var argus =
        ModalRoute.of(context)?.settings.arguments as RecomamendedWidgetArgus;
    return FutureBuilder<SimillarResponse?>(
      future: ApiManager.getSimillarResult(argus.id),
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

        if (snapshot.data!.success == 'false') {
          return Text(snapshot.data!.status_message!);
        }
        var resultList = snapshot.data!.results!;
        //resultList[index].title??""
        return Column(children: [
          RecomendedWidget(
            resultList: resultList,
            widgetTitle: "",
          ),
        ]);
      },
    );
  }
}
