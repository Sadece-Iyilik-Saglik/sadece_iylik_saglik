import 'package:flutter/material.dart';
import 'package:sadece_iylik_saglik/core/base/state/base_state.dart';
import 'package:sadece_iylik_saglik/core/base/view/base_view.dart';
import 'package:sadece_iylik_saglik/view/article/article_screen.dart';
import 'package:sadece_iylik_saglik/view/auth/login_screen.dart';
import 'package:sadece_iylik_saglik/view/question/question_screen.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sadece_iylik_saglik/view/question/pre_question_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  List<String> cardImages = [
    "assets/images/piknik.png",
    "assets/images/1.png",
    "assets/images/30.png"
  ];

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
        appBar: appBar,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                carouselArea(),
                menuButtons,
                bottomMenuButtons,
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
        backgroundColor: themeData.primaryColor,
        actions: [
          popUpMenu,
        ],
      );

  Widget get popUpMenu => PopupMenuButton<int>(
        offset: const Offset(-10, 40),
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        elevation: 20,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: Color(0xFF273C66),
          ),
        ),
        color: const Color(0xFFED8C42),
        itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<int>>[
            const PopupMenuItem<int>(
              value: 1,
              child: Text(
                'SSS',
                style: TextStyle(color: Colors.white), // Seçenek metin rengi
              ),
            ),
            const PopupMenuItem<int>(
              value: 2,
              child: Text(
                'İletişim',
                style: TextStyle(color: Colors.white), // Seçenek metin rengi
              ),
            ),
            const PopupMenuItem<int>(
              value: 3,
              child: Text(
                'Çıkış yap',
                style: TextStyle(color: Colors.white), // Seçenek metin rengi
              ),
            ),
          ];
        },
        onSelected: (int value) {
          switch (value) {
            case 1:
              break;
            case 2:
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
              break;
          }
        },
      );
  Widget carouselArea() {
    return SizedBox(
      width: double.maxFinite,
      height: dynamicHeight(0.28),
      child: PageView.builder(
        pageSnapping: true,
        itemCount: 3,
        allowImplicitScrolling: true,
        itemBuilder: (context, index) {
          return carouselCard(cardImages[index]);
        },
      ),
    );
  }

  Widget carouselCard(String image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [],
        ),
        child: InkWell(
          onTap: () {
            showPhotoDetail(context, image);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFED8C42),
                width: 3.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  void showPhotoDetail(BuildContext context, String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            width: dynamicWidth(0.95),
            height: dynamicHeight(0.45),
            child: Stack(
              children: <Widget>[
                // Fotoğrafı yakınlaştırma ve kaydırma eklemek için PhotoView kullanın
                PhotoView(
                  // initialScale: 0.2,
                  maxScale: 0.99,
                  enablePanAlways: false,
                  enableRotation: false,
                  disableGestures: true,
                  // gaplessPlayback: true,
                  // tightMode: true,
                  // minScale: 0.8,
                  imageProvider: AssetImage(image),
                  backgroundDecoration: const BoxDecoration(
                      color: Colors.transparent,
                      backgroundBlendMode: BlendMode.clear),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget get menuButtons => Column(
        children: [
          customMenuButton(
            "Buraya günlük sözler gelecek",
            Colors.accents[0].shade100,
            0.1,
            0.85,
            () {
              // showDailyQuotesDialog(context);
            },
          ),
          customMenuButton(
            "Soru",
            Colors.accents[1].shade200,
            0.1,
            0.85,
            () =>Navigator.push(context, MaterialPageRoute(builder: (context) => const PreQuestionScreen(),)),
          ),
          customMenuButton(
            "Makale",
            Colors.accents[2].shade200,
            0.1,
            0.85,
            () => showArticlePage(),
          ),
          customMenuButton(
            "Departmanlar",
            Colors.accents[3].shade100,
            0.1,
            0.85,
            () => {
              showQuestionsPage()
              // showDepartmentsPage()
            },
          ),
        ],
      );
  Widget get bottomMenuButtons => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customMenuButton(
            "Reklam",
            Colors.accents[4].shade200,
            0.1,
            0.40,
            () => showAdPage(),
          ),
          customMenuButton(
            "Emeği Geçenler",
            Colors.accents[5].shade200,
            0.1,
            0.4,
            showContributors,
          ),
        ],
      );
  Widget customMenuButton(String s, Color color, double height, double width,
      Function() onTapFunction) {
    return InkWell(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(
          //   color: const Color(0xFFED8C42),
          //   width: 0,
          // ),
          gradient: LinearGradient(
            colors: [
              const Color(0xFF273C66),
              color,
            ],
          ),
        ),
        width: dynamicWidth(width),
        height: dynamicHeight(height),
        child: Center(
          child: Text(
            s,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  // void showDailyQuotesDialog(BuildContext context) {
  //   showGeneralDialog(
  //     barrierLabel: "Label",
  //     barrierDismissible: true,
  //     barrierColor: Colors.black.withOpacity(0.6),
  //     transitionDuration: const Duration(milliseconds: 200),
  //     context: context,
  //     pageBuilder: (context, animation1, animation2) {
  //       final curvedValue = Curves.easeInOut.transform(animation1.value);
  //       return Center(
  //         child: SizedBox(
  //           width: dynamicWidth(0.9),
  //           child: Material(
  //             color: Colors.transparent,
  //             child: Transform.scale(
  //               scale: 1 + (0.2 * curvedValue),
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(15),
  //                 ),
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: <Widget>[
  //                     Container(
  //                       width: double.infinity,
  //                       padding: const EdgeInsets.all(20),
  //                       decoration: const BoxDecoration(
  //                         color: Color(0xFF273C66),
  //                         borderRadius: BorderRadius.only(
  //                           topLeft: Radius.circular(15),
  //                           topRight: Radius.circular(15),
  //                         ),
  //                       ),
  //                       child: const Center(
  //                         child: Text(
  //                           "Günlük Sözler",
  //                           style: TextStyle(
  //                             fontSize: 24,
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     Container(
  //                       padding: const EdgeInsets.all(16),
  //                       child: Column(
  //                         children: <Widget>[
  //                           const Text(
  //                             "Burada günlük sözlerin içeriği veya diğer bilgiler yer alabilir.",
  //                             style: TextStyle(fontSize: 17),
  //                           ),
  //                           const SizedBox(height: 20),
  //                           ElevatedButton(
  //                             style: const ButtonStyle(),
  //                             onPressed: () {
  //                               Navigator.of(context).pop();
  //                             },
  //                             child: const Text("Kapat"),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  void showQuestionsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const QuestionScreen(),
      ),
    );
  }

  void showArticlePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ArticleScreen(),
      ),
    );
  }

  void showDepartmentsPage() {}

  void showAdPage() {}

  void showContributors() {}
}
