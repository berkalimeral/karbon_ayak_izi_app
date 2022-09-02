import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/screens/result_and_profil_page.dart';
import 'package:karbon_ayak_izi_app/services/firebase_authenticate.dart';

import '../model/question_model.dart';
import '../question_pages/question_one.dart';

class CarbonFootprintForm extends StatefulWidget {
  const CarbonFootprintForm({Key? key}) : super(key: key);

  @override
  State<CarbonFootprintForm> createState() => _CarbonFootprintFormState();
}

class _CarbonFootprintFormState extends State<CarbonFootprintForm> {
  late PageController controller;
  int slideIndex = 0;

  late Future<List<QuestionModel>> questionFuture;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    questionFuture = questionOku();
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Future<List<QuestionModel>> questionOku() async {
    String okunanString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/question_answers_model.json');
    var jsonObje = json.decode(okunanString);

    return jsonObje.map<QuestionModel>(QuestionModel.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    const data = 'Karbon Ayak İzim';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          data,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 125,
        child: Padding(
          padding: const EdgeInsets.only(top: 2.5),
          child: FutureBuilder(
            future: questionOku(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final questions = snapshot.data! as List<QuestionModel>;
                return buildPageView(questions);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
      bottomSheet: buildBottomSheet(context),
      // : InkWell(
      //     onTap: () {
      //       Navigator.push(context, MaterialPageRoute(builder: (context) => ResultProfilePage(),));
      //     },
      //     child: Container(
      //       height: 60,
      //       color: Colors.blue,
      //       alignment: Alignment.center,
      //       child: const Text(
      //         "CONTİNUE",
      //         style: TextStyle(
      //             color: Colors.white, fontWeight: FontWeight.w600),
      //       ),
      //     ),
      //   ),
    );
  }

  Container buildBottomSheet(BuildContext context) {
    const data = "NEXT";
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                controller.animateToPage(slideIndex - 1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          Row(
            children: [
              for (int i = 0; i < 10; i++)
                i == slideIndex
                    ? _buildPageIndicator(true)
                    : _buildPageIndicator(false),
            ],
          ),
          slideIndex != 9
              ? TextButton(
                  onPressed: () {
                    controller.animateToPage(slideIndex + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear);
                  },
                  child: const Text(
                    data,
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w600),
                  ),
                )
              : TextButton(
                  onPressed: () {
                    double result = 0;
                    double calculateResult() {
                      for (var i = 0; i < finalResult.length; i++) {
                        result = finalResult[i] + result;
                      }
                      return result;
                    }

                    double newResult = calculateResult();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultProfilePage(
                            result: newResult,
                          ),
                        ));
                  },
                  child: const Text(
                    "FINISH",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w600),
                  ),
                ),
        ],
      ),
    );
  }

  PageView buildPageView(List<QuestionModel> questionModel) {
    return PageView.builder(
      itemCount: questionModel.length,
      itemBuilder: (context, index) {
        final question = questionModel[index];
        return QuestionOne(
          index: slideIndex,
          question: question,
          answerIndex: index,
        );
      },
      controller: controller,
      onPageChanged: (value) {
        setState(() {
          slideIndex = value;
        });
      },
    );
  }
}


            // const Text(
            //     "Tıpkı bir yere bastığımızda ayak izimizin kalması gibi, üretim, tüketim, seyahat dahil her türlü yaşamsal faaliyetimizle ve kullandığımız ürünlerle ortaya çıkardığımız sera gazlarıyla gezegende bıraktığımız etkidir Karbon Ayak İzi'miz",
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       fontWeight: FontWeight.w500,
            //       fontSize: 14,
            //     ))
