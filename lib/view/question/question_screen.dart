import 'package:flutter/material.dart';
import 'package:sadece_iylik_saglik/core/base/state/base_state.dart';

import 'package:sadece_iylik_saglik/core/base/view/base_view.dart';
import 'package:sadece_iylik_saglik/core/components/dialog/custom_dialog.dart';
import 'package:sadece_iylik_saglik/core/viewmodel/exam_view_model.dart';

import '../../core/model/exam_model.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends BaseState<QuestionScreen> {
  List<Exam> get ex => ExamViewModel.allExams;
  int selectedOption = -1;
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
        bottomNavigationBar: bottomBar,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...examNumberArea,
                contentArea,
                ...List.generate(ex.first.questions.first.options.length,
                    (index) => optionArea(ex.first.questions.first.options[index], index)),
              ],
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
        actions: const [],
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
            drawerHeader,
            questionButtons,
            decisionButtons,
          ],
        ),
      );

  Widget get drawerHeader => Container(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        alignment: Alignment.center,
        child: const Text(
          "Komite 1\nDers 1", // Replace with your quiz title
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      );

  Widget get questionButtons => Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of buttons in a row
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rectangle shape
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      );

  Widget get decisionButtons => Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 150, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rectangle shape
                    )),),child: Container(
              padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
              alignment: Alignment.center,
              child: const Text(
                "Komite 1\nDers 1", // Replace with your quiz title
                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              ),)
            
            )),
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
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Rectangle shape
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  );
})
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
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Rectangle shape
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
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Rectangle shape
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

  Widget get bottomBar => BottomAppBar(
        elevation: 100,
        height: dynamicHeight(0.15),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: selectedOption == -1,
                    onChanged: (value) => setState(() {
                      value == true ? selectedOption = -1 : selectedOption = -2;
                    }),
                  ),
                  const Text("Boş Bırak"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if (selectedOption + 1 > ex.first.questions.first.options.length || selectedOption + 1 < 0) {
                        CustomDialog.buildCustomDialog(
                                context: context,
                                title: "Hiçbir cevap seçmediniz !",
                                content:
                                    "Soruya herhangi bir cevap vermeden geçemezsiniz.\n\"Boş Bırak\" olarak işaretlemek istiyor musunuz?",
                                width: dynamicWidth(0.9))
                            .then((value) {
                          if (value == -1) {
                            setState(() {
                              selectedOption = -1;
                            });
                          }
                        });
                      }
                    },
                    icon: const Icon(Icons.keyboard_double_arrow_right_rounded),
                    label: const Text("Kaydet"),
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green),
                        foregroundColor: MaterialStatePropertyAll(Colors.white)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      CustomDialog.buildCustomDialog(
                              context: context,
                              title: "Sınavı Bitir",
                              content:
                                  "Sınavınızı bitirdiğinizden emin olun!\nEğer evet derseniz sınavınız sonlandırılacak",
                              width: dynamicWidth(0.9))
                          .then((value) {
                        if (value == -1) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text("Sınavınız tamamlandı...")));
                        }
                      });
                    },
                    icon: const Icon(Icons.stop_rounded),
                    label: const Text("Bitir"),
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red),
                        foregroundColor: MaterialStatePropertyAll(Colors.white)),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  List<Widget> get examNumberArea => [
        Container(
            width: double.maxFinite,
            height: dynamicHeight(0.05),
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: const Text(
              "Soru 1",
            )),
        const Divider(
          indent: 25,
          endIndent: 25,
          height: 0,
        )
      ];

  Padding get contentArea => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Text(ex.first.questions.first.content),
      );

  Widget optionArea(String option, int i) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 5, right: 5),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        tileColor: selectedOption == i ? Colors.grey.shade200 : null,
        onTap: () {
          setState(() {
            selectedOption = i;
          });
        },
        leading: Text(i == 0
            ? "A. "
            : i == 1
                ? "B. "
                : i == 2
                    ? "C. "
                    : i == 3
                        ? "D. "
                        : i == 4
                            ? "E. "
                            : "x"),
        title: Text(
          option,
          style: themeData.textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class ButtonImageFb1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const ButtonImageFb1({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: AspectRatio(
        aspectRatio: 208 / 71,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                color: const Color(0x004960f9).withOpacity(.3),
                spreadRadius: 4,
                blurRadius: 50)
          ]),
          child: MaterialButton(
            onPressed: onPressed,
            splashColor: Colors.lightBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
            padding: const EdgeInsets.all(0.0),
            child: Ink(
                decoration: BoxDecoration(
                  //gradient:
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/finance_app_2%2FbuttonBackgroundSmall.png?alt=media&token=fa2f9bba-120a-4a94-8bc2-f3adc2b58a73"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Container(
                    constraints: const BoxConstraints(
                        minWidth: 88.0,
                        minHeight: 36.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: Text(text,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300)))),
          ),
        ),
      ),
    );
  }
}
