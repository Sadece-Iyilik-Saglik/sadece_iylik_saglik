import 'package:flutter/material.dart';
import 'package:sadece_iylik_saglik/core/base/state/base_state.dart';
import 'package:sadece_iylik_saglik/core/base/view/base_view.dart';
import 'package:sadece_iylik_saglik/core/constants/app/color_strings.dart';
import 'package:sadece_iylik_saglik/core/constants/app/image_strings.dart';
import 'package:sadece_iylik_saglik/view/article/article_screen.dart';
import 'package:sadece_iylik_saglik/view/auth/login_screen.dart';
import 'package:sadece_iylik_saglik/view/question/question_screen.dart';
import 'package:photo_view/photo_view.dart';

import '../onboarding/components/card_customized.dart';
import 'components/image_overlay.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              carouselArea(),
              menuButtons,
              bottomMenuButtons,
              bottomCard
            ],
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
  Widget get bottomCard {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: 3.14, // 180 derece döndürme
          child: Container(
            height: 130,
            width: double.infinity,
            color: AppColor.kLine,
            child: CustomPaint(
              painter: WavePainter(
                color: AppColor.kWhite,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bazen, hastayı iyileştirmek için sadece onunla konuşmak yeterlidir.",
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                  height: 8), // Add some space between the quote and the author
              Text(
                "Galen",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

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
      padding: const EdgeInsets.all(10.0),
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
                color: AppColor.kSecondary,
                width: 2.5,
              ),
              borderRadius: BorderRadius.circular(5),
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
          firstRowOfQuestionAndArticle,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GestureDetector(
              onTap: () {
                // showDepartmentsPage();
                showQuestionsPage();
              },
              child: ImageOverlayCard(
                imageLink: ImagesPath.homeScreenDepartments,
                title: 'Departmanlar',
                width: dynamicWidth(0.92),
                height: 110,
              ),
            ),
          ),
        ],
      );
  Widget get firstRowOfQuestionAndArticle => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Burada tıklama olayına ne yapılacağını ekleyebilirsiniz.
              // Örneğin, bir sayfaya gitmek için Navigator kullanabilirsiniz.
            },
            child: ImageOverlayCard(
              imageLink: ImagesPath.homeScreenQuestion,
              title: 'Soru',
              width: dynamicWidth(0.45),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              showArticlePage();
            },
            child: ImageOverlayCard(
              imageLink: ImagesPath.homeScreenArticle,
              title: 'Makale',
              width: dynamicWidth(0.45),
              height: 150,
            ),
          ),
        ],
      );

  Widget get bottomMenuButtons => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              showAdPage();
            },
            child: ImageOverlayCard(
              imageLink: ImagesPath.homeScreenAdvertisement,
              title: 'Reklam',
              width: dynamicWidth(0.45),
              height: 100,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              showContributors();
            },
            child: ImageOverlayCard(
              imageLink: ImagesPath.homeScreenContributors,
              title: 'Emeği Geçenler',
              width: dynamicWidth(0.45),
              height: 100,
            ),
          ),
        ],
      );

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
