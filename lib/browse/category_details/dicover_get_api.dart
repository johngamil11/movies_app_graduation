import 'package:flutter/material.dart';
import 'package:movies_app_team/browse/category_details/movies_list.dart';
import 'package:movies_app_team/browse/main_category_screen/category_screen.dart';
import 'package:movies_app_team/model/DiscoverResponse.dart';

import '../../../api/api_manager.dart';
import '../../../colors.dart';

class DiscoverGetApi extends StatelessWidget {
  static const String routeName = 'discoverApi';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as CategoryScreenArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.category.toString() + " Movies",
          style: TextStyle(color: Colors.white),
        ),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: FutureBuilder<DiscoverResponse?>(
        future: ApiManager.getDiscoverResult(args.id.toString()),
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
          return MoviesList(
            resultList: resultList,
          );
        },
      ),
    );
  }
}
