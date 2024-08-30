import 'package:flutter/material.dart';
import 'package:movies_app_team/browse/main_category_screen/category_screen.dart';

import '../../../api/api_manager.dart';
import '../../../colors.dart';
import '../../model/GenreResponse.dart';

class GenreGetApi extends StatelessWidget {
  const GenreGetApi({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GenreResponse?>(
      future: ApiManager.getGenreResult(),
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
        var resultList = snapshot.data!.genres!;
        //resultList[index].title??""
        return CategoryScreen(resultList: resultList);
      },
    );
  }
}
