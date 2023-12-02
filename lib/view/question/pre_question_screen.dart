import 'package:flutter/material.dart';
import 'package:sadece_iylik_saglik/core/base/view/base_view.dart';
import 'package:sadece_iylik_saglik/core/viewmodel/exam_view_model.dart';

class PreQuestionScreen extends StatelessWidget {
  const PreQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      onPageBuilder: (context, value) {
        return scaffoldBody;
      },
      onModelReady: (model) {},
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: appBar,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(8),
                  child: DropdownButton(
                    value: null,
                    hint: const Text("Dönem"),
                    borderRadius: BorderRadius.circular(5),
                    dropdownColor: Colors.blue,
                    elevation: 0,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    underline: const SizedBox.shrink(),
                    items: ExamViewModel.periods
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
                DropdownButton(
                  value: null,
                  hint: const Text("Komite"),
                  items: ExamViewModel.committees
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
                ElevatedButton(onPressed: () {}, child: const Icon(Icons.keyboard_double_arrow_right_rounded))
              ],
            ),
          ],
        ),
      );

  PreferredSizeWidget get appBar => AppBar();
}
