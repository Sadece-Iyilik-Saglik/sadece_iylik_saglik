import 'package:flutter/material.dart';

import 'package:sadece_iylik_saglik/core/base/view/base_view.dart';
import 'package:sadece_iylik_saglik/core/viewmodel/exam_view_model.dart';

import '../../core/model/exam_model.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<Exam> get ex => ExamViewModel.allExams;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      onModelReady: (model) {},
      onPageBuilder: (context, value) {
        return scaffoldBody;
      },
    );
  }

  Widget get scaffoldBody => Scaffold(
        drawer: drawer,
        appBar: appBar,
        body: const SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          ),
        ),
      );

  PreferredSizeWidget get appBar => AppBar(
        centerTitle: true,
        title: const Text(
          "Sadece İyilik Sağlık",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFED8C42),
        // backgroundColor: themeData.primaryColor,
        actions: [],
      );

  Widget get drawer => Drawer(
        elevation: 20,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        backgroundColor: const Color(0xFF2A4270),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
              alignment: Alignment.center,
              child: const Text(
                "Komite 1\nDers 1", // Replace with your quiz title
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of buttons in a row
                ),
                itemCount: 10, // Replace with the number of questions
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Rectangle shape
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "${index + 1}",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your function to handle the "Finish Quiz" button tap here
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Rectangle shape
                          ),
                        ),
                      ),
                      child: const Text(
                        "Ara ver",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your function to handle the "End Quiz" button tap here
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Rectangle shape
                          ),
                        ),
                      ),
                      child: const Text(
                        "Bitir",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
