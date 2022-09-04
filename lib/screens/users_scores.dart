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
      appBar: AppBar(
        title: const Text(
          'Results',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: FutureBuilder(
          future: userScoreController.scores.value,
          builder: (context, AsyncSnapshot<List<UserScoreModel>> snapshot) {
            if (snapshot.hasData) {
              // debugPrint(snapshot.data.toString());
              return Column(
                children: [
                  Container(
                    height: 300,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: CustomBarChart(userChart: snapshot.data!),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      height: 30,
                      child: Text(
                        'Leaderboard',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.green, fontSize: 24),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 311,
                    child: ListView.separated(
                      itemCount: snapshot.data!.length,
                      separatorBuilder: (context, index) =>
                          const Divider(thickness: 2),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                              Text(snapshot.data![index].userName.toString()),
                          leading: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Center(child: Text('#${index + 1}')),
                          ),
                          trailing:
                              Text(snapshot.data![index].userScore.toString()),
                        );
                      },
                    ),
                  ),
                ],
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
  const CustomBarChart({Key? key, required this.userChart}) : super(key: key);
  final List<UserScoreModel> userChart;
  @override
  Widget build(BuildContext context) {
    debugPrint(userChart.toString());
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
