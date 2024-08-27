import 'package:flutter/material.dart';
import 'package:movies_app_team/home/slider/slider_widget.dart';

import '../../api/api_manager.dart';
import '../../colors.dart';
import '../../model/SliderResponse.dart';

class SliderGetApi extends StatelessWidget {
  const SliderGetApi({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SliderResponse?>(
      future: ApiManager.getSliderResult(),
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
          SliderWidget(resultList: resultList),
        ]);
      },
    );
  }
}
