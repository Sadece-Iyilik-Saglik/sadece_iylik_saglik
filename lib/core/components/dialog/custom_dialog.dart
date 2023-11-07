import 'package:flutter/material.dart';

class CustomDialog {
  static Future<int?> buildCustomDialog({
    required final BuildContext context,
    required final String title,
    required final String content,
    required final double width,
  }) {
    return showGeneralDialog<int?>(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 200),
      context: context,
      pageBuilder: (context, animation1, animation2) {
        final curvedValue = Curves.easeInOut.transform(animation1.value);
        return Center(
          child: SizedBox(
            width: width,
            child: Material(
              color: Colors.transparent,
              child: Transform.scale(
                scale: 1 + (0.2 * curvedValue),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Color(0xFF273C66),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: <Widget>[
                            Text(
                              content,
                              style: const TextStyle(fontSize: 17),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: const ButtonStyle(),
                                  onPressed: () {
                                    Navigator.of(context).pop<int>(-1);
                                  },
                                  child: const Text("Evet"),
                                ),
                                ElevatedButton(
                                  style: const ButtonStyle(),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Hayır"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ).then((value) => value);
  
  }
}
