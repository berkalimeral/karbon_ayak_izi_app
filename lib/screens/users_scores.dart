import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';
import 'package:karbon_ayak_izi_app/controller/user_score_controller.dart';
import '../model/user_score_model.dart';

class UserScores extends StatelessWidget {
  UserScores({Key? key}) : super(key: key);

  final UserScoreController userScoreController =
      Get.put(UserScoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: SizedBox(
        //     height: 250, child: CustomBarChart(userChart: UserScoreModel.data)),
        child: FutureBuilder(
          future: userScoreController.scores.value,
          builder: (context, AsyncSnapshot<List<UserScoreModel>> snapshot) {
            userScoreController.services.getUserScore();
            if (snapshot.hasData) {
              debugPrint(snapshot.data.toString());
              return Container(
                height: 250,
                padding: const EdgeInsets.all(10),
                child: CustomBarChart(userChart: snapshot.data!),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const CircularProgressIndicator(
                color: Colors.black,
              );
            }
          },
        ),
      ),
    );
  }
}

class CustomBarChart extends StatelessWidget {
  final List<UserScoreModel> userChart;
  const CustomBarChart({Key? key, required this.userChart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<UserScoreModel, String>> series = [
      charts.Series(
        id: 'scores',
        data: userChart,
        domainFn: (series, _) => series.userName!,
        measureFn: (series, _) => series.userScore,
        colorFn: (series, _) => series.barColor!,
      )
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}
