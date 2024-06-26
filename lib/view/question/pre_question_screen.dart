import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sadece_iylik_saglik/core/base/state/base_state.dart';
import 'package:sadece_iylik_saglik/core/base/view/base_view.dart';
import 'package:sadece_iylik_saglik/core/components/dropdownbutton/custom_dropdownbutton.dart';
import 'package:sadece_iylik_saglik/core/constants/enum/komite_enum.dart';
import 'package:sadece_iylik_saglik/core/constants/enum/donem_enum.dart';
import 'package:sadece_iylik_saglik/core/viewmodel/exam_view_model.dart';
import 'package:sadece_iylik_saglik/view/question/question_screen.dart';

class PreQuestionScreen extends StatefulWidget {
  const PreQuestionScreen({super.key});

  @override
  BaseState<PreQuestionScreen> createState() => _PreQuestionScreenState();
}

class _PreQuestionScreenState extends BaseState<PreQuestionScreen> {
  Komite? selectedComitte;
  Donem? selectedPeriod;
  late ExamViewModel examViewModel;
  late WidgetRef ref;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: examViewModelProvider,
      onPageBuilder: (context, value) {
        examViewModel = ref.watch(examViewModelProvider);
        return scaffoldBody;
      },
      onModelReady: (model) {
        ref = model;
      },
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // selectionArea,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Testler",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                        onTap: () {},
                        child: const Text(
                          "Tümünü göster",
                          style: TextStyle(color: Color.fromRGBO(158, 158, 158, 1)),
                        )),
                  )
                ],
              ),
              customDivider,
              examListArea,
              // Sonraki güncellemelerde bu kısım eklenecek
              // const Padding(
              //   padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              //   child: Align(
              //     alignment: Alignment.centerLeft,
              //     child: Text(
              //       "En son",
              //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              //     ),
              //   ),
              // ),
              // customDivider,
              // recentListArea,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sonuçlarım",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                        onTap: () {},
                        child: const Text(
                          "Tümünü göster",
                          style: TextStyle(color: Color.fromRGBO(158, 158, 158, 1)),
                        )),
                  )
                ],
              ),
              customDivider,
              recentResultArea
            ],
          ),
        ),
      );

  PreferredSizeWidget get appBar => AppBar();

  Widget get selectionArea => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomDropdownButton(
              width: dynamicWidth(0.4),
              color: const Color.fromRGBO(227, 242, 253, 1),
              foregroundColor: const Color.fromRGBO(13, 71, 161, 1),
              borderRadius: BorderRadius.circular(10),
              hintText: "Dönem",
              selectedValue: selectedPeriod,
              onChanged: (p0) {
                setState(() {
                  selectedPeriod = p0;
                });
              },
              items: Donem.values
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.name,
                          style: const TextStyle(color: Color.fromRGBO(13, 71, 161, 1)),
                        ),
                      ))
                  .toList()),
          CustomDropdownButton(
              width: dynamicWidth(0.4),
              color: const Color.fromRGBO(227, 242, 253, 1),
              foregroundColor: const Color.fromRGBO(13, 71, 161, 1),
              borderRadius: BorderRadius.circular(10),
              hintText: "Komite",
              selectedValue: selectedComitte,
              onChanged: (p0) {
                setState(() {
                  selectedComitte = p0;
                });
              },
              items: Komite.values
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.name,
                          style: const TextStyle(color: Color.fromRGBO(13, 71, 161, 1)),
                        ),
                      ))
                  .toList()),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(10),
            child: Ink(
              decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.keyboard_double_arrow_right_rounded),
            ),
          ),
        ],
      );

  Widget get examListArea => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
            height: 171,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: PageController(viewportFraction: 1 / 3),
              itemCount: examViewModel.allExams.length,
              padEnds: false,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    children: [
                      Container(
                        width: 104,
                        height: 75,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(13, 71, 161, 1), borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: AutoSizeText(
                                  examViewModel.allExams[index].examName,
                                  maxFontSize: 20,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500, color: Color.fromRGBO(227, 242, 253, 1)),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: InkWell(
                                onTap: () => showExamInfo(index),
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white54,
                                  ),
                                  child: Icon(Icons.info_outline, color: Colors.blue.shade900),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                          style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(EdgeInsets.only(left: 6, right: 18)),
                              backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(13, 71, 161, 1)),
                              foregroundColor: WidgetStatePropertyAll(Color.fromRGBO(227, 242, 253, 1))),
                          onPressed: () => startTest(index),
                          icon: const Icon(Icons.double_arrow_rounded, color: Color.fromRGBO(227, 242, 253, 1)),
                          label: const Text("Teste Başla", style: TextStyle(fontSize: 10)))
                    ],
                  ),
                );
              },
            )),
      );

  Widget get recentListArea => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
            height: 171,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: PageController(viewportFraction: 1 / 3),
              itemCount: examViewModel.allExams.length,
              padEnds: false,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    children: [
                      Container(
                        width: 104,
                        height: 143,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(13, 71, 161, 1), borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Text(
                              examViewModel.allExams[index].donemName.name.replaceAll("Donem_", "Dönem "),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(227, 242, 253, 1),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              examViewModel.allExams[index].komiteName.name.replaceAll("_", " "),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14, color: Color.fromRGBO(227, 242, 253, 1)),
                            ),
                            const Spacer(),
                            TextButton(
                                onPressed: () {
                                  //Burada Quesiton ekranınına seçili olan exam verisi gönderilecek.
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => QuestionScreen(exam: examViewModel.allExams[index]),
                                      ));
                                },
                                child: const Text(
                                  "Devam et >>",
                                  style: TextStyle(fontSize: 12, color: Color.fromRGBO(227, 242, 253, 1)),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          height: 18,
                          child: Center(
                            child: Text(
                              examViewModel.allExams[index].examName,
                              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )),
      );

  Widget get recentResultArea => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: SizedBox(
          height: dynamicHeight(0.4),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  leading: const Icon(Icons.timelapse_sharp),
                  title: const Text("Anatomi Testi"),
                  subtitle: const Text("Dönem 1 > Komite 1"),
                  // trailing: const Icon(Icons.info_outline),
                  trailing: const Icon(Icons.keyboard_double_arrow_right_rounded),
                  tileColor: const Color.fromARGB(200, 13, 72, 161),
                  textColor: const Color.fromRGBO(227, 242, 253, 1),
                  iconColor: const Color.fromRGBO(227, 242, 253, 1),
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      );

  void showExamInfo(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Detaylar"),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text("Test Adı: "),
                  Text(
                    examViewModel.allExams[index].examName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("Dönem: "),
                  Text(
                    examViewModel.allExams[index].donemName.name.replaceAll("Donem_", "Dönem "),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("Komite: "),
                  Text(
                    examViewModel.allExams[index].komiteName.name.replaceAll("_", " "),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("Soru Sayısı: "),
                  Text(
                    examViewModel.allExams[index].questions.length.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("Tahmini Süre: "),
                  Text(
                    "${examViewModel.allExams[index].questions.length * 3} dk",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("İptal")),
            FilledButton.icon(
              onPressed: () => startTest(index),
              label: const Text("Teste Başla"),
              icon: const Icon(Icons.double_arrow_rounded),
            )
          ],
        );
      },
    );
  }

  void startTest(int index) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => QuestionScreen(exam: examViewModel.allExams[index])));
  }

  Widget get customDivider => Divider(color: Colors.grey.shade100, indent: 20, endIndent: 20, height: 1);
}
