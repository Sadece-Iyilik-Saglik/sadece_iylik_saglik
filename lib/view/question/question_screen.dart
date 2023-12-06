import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/base/state/base_state.dart';
import '../../core/base/view/base_view.dart';
import '../../core/components/dialog/custom_dialog.dart';
import '../../core/model/exam_model.dart';

class QuestionScreen extends StatefulWidget {
  final Exam exam;
  const QuestionScreen({
    Key? key,
    required this.exam,
  }) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends BaseState<QuestionScreen> {
  int selectedOption = -1;
  bool isBottomBarVisible = true;

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
                // ...examNumberArea,
                contentArea,
                ...List.generate(widget.exam.questions.first.options.length,
                    (index) => optionArea(widget.exam.questions.first.options[index], index)),
              ],
            ),
          ),
        ),
      );

  PreferredSizeWidget get appBar => AppBar(
        centerTitle: true,
        title: Text(
          widget.exam.examName,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFED8C42),
        // backgroundColor: themeData.primaryColor,
      );
  Widget get drawer => Drawer(
        elevation: 20,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        width: dynamicWidth(0.7),
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
          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
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
              padding: const EdgeInsets.all(12.0),
              child: OutlinedButton(
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
                  style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      );

  Widget get decisionButtons => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: dynamicWidth(0.7),
            height: dynamicHeight(0.3),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              // , bottom: 200
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
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
                  const SizedBox(width: 10),
                  ElevatedButton(
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
                ],
              ),
            ),
          ),
        ],
      );

  Widget get bottomBar => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isBottomBarVisible = !isBottomBarVisible;
              });
            },
            child: Ink(
                width: 40,
                height: 35,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color.fromRGBO(189, 189, 189, 1),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                child: Icon(isBottomBarVisible ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded)),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color.fromRGBO(189, 189, 189, 1),
              )
            ]),
            height: isBottomBarVisible ? dynamicHeight(0.18) : 0,
            child: BottomAppBar(
              elevation: 0,
              // shadowColor: Colors.grey.shade400,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: selectedOption == -1,
                            onChanged: (value) => setState(
                              () {
                                value == true ? selectedOption = -1 : selectedOption = -2;
                              },
                            ),
                          ),
                          const Text("Boş Bırak"),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          child: CupertinoButton(
                            color: const Color(0xFFED8C42),
                            onPressed: () {
                              if (selectedOption + 1 > widget.exam.questions.first.options.length ||
                                  selectedOption + 1 < 0) {
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
                            child: const Text("Kaydet"),
                          ),
                        ),
                        Card(
                          child: CupertinoButton(
                            color: const Color(0xFFED8C42),
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
                            child: const Text("Bitir"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  // List<Widget> get examNumberArea => [
  //       Container(
  //           width: double.maxFinite,
  //           height: dynamicHeight(0.03),
  //           alignment: Alignment.center,
  //           padding: const EdgeInsets.symmetric(horizontal: 25),
  //           child: const CircleAvatar(
  //             backgroundColor: Color(0xFFED8C42),
  //             child: Text(
  //               "1",
  //             ),
  //           )),
  //     ];

  Widget get contentArea => Card(
        color: Colors.white,
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFED8C42),
                radius: 24,
                child: Text(
                  "1",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Text(
                    //   "Kanser",
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // const SizedBox(height: 8),
                    Text(
                      widget.exam.questions.first.content,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget optionArea(String option, int i) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: selectedOption == i ? const Color(0xFF273C66) : Colors.transparent,
        ),
        child: ListTile(
          onTap: () {
            setState(() {
              selectedOption = i;
            });
          },
          title: Text(
            option,
            style: TextStyle(
              fontSize: 16,
              color: selectedOption == i ? Colors.white : Colors.black,
              fontWeight: selectedOption == i ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: selectedOption == i ? const Color(0xFFED8C42) : Colors.grey,
            child: Text(
              String.fromCharCode(65 + i), // ASCII 'A' is 65
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget get bottomBar => BottomAppBar(
//       elevation: 100,
//       height: dynamicHeight(0.15),
//       color: Colors.white,
//       surfaceTintColor: Colors.white,
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Card(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Checkbox(
//                     value: selectedOption == -1,
//                     onChanged: (value) => setState(() {
//                       value == true
//                           ? selectedOption = -1
//                           : selectedOption = -2;
//                     }),
//                   ),
//                   const Text("Boş Bırak"),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     if (selectedOption + 1 >
//                             ex.first.questions.first.options.length ||
//                         selectedOption + 1 < 0) {
//                       CustomDialog.buildCustomDialog(
//                               context: context,
//                               title: "Hiçbir cevap seçmediniz !",
//                               content:
//                                   "Soruya herhangi bir cevap vermeden geçemezsiniz.\n\"Boş Bırak\" olarak işaretlemek istiyor musunuz?",
//                               width: dynamicWidth(0.9))
//                           .then((value) {
//                         if (value == -1) {
//                           setState(() {
//                             selectedOption = -1;
//                           });
//                         }
//                       });
//                     }
//                   },
//                   icon: const Icon(Icons.keyboard_double_arrow_right_rounded),
//                   label: const Text("Kaydet"),
//                   style: const ButtonStyle(
//                       backgroundColor: MaterialStatePropertyAll(Colors.green),
//                       foregroundColor:
//                           MaterialStatePropertyAll(Colors.white)),
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     CustomDialog.buildCustomDialog(
//                             context: context,
//                             title: "Sınavı Bitir",
//                             content:
//                                 "Sınavınızı bitirdiğinizden emin olun!\nEğer evet derseniz sınavınız sonlandırılacak",
//                             width: dynamicWidth(0.9))
//                         .then((value) {
//                       if (value == -1) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                                 content: Text("Sınavınız tamamlandı...")));
//                       }
//                     });
//                   },
//                   icon: const Icon(Icons.stop_rounded),
//                   label: const Text("Bitir"),
//                   style: const ButtonStyle(
//                       backgroundColor: MaterialStatePropertyAll(Colors.red),
//                       foregroundColor:
//                           MaterialStatePropertyAll(Colors.white)),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
