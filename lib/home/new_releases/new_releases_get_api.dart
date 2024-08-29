import 'package:flutter/material.dart';

import '../../api/api_manager.dart';
import '../../colors.dart';
import '../../model/UpcomingMoviesResponse.dart';
import 'newReleasesWidget.dart';

class NewReleasesGetApi extends StatelessWidget {
  const NewReleasesGetApi({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UpcomingMoviesResponse?>(
      future: ApiManager.getResult(),
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
          NewReleasesWidget(resultList: resultList),
        ]);
      },
    );
  }
}
