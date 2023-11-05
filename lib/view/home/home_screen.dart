import 'package:flutter/material.dart';
import 'package:sadece_iylik_saglik/core/base/state/base_state.dart';
import 'package:sadece_iylik_saglik/core/base/view/base_view.dart';
import 'package:sadece_iylik_saglik/view/auth/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
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
              children: [carouselArea, menuButtons, bottomMenuButtons],
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
          PopupMenuButton<int>(
            icon: Icon(Icons.more_vert,
                color: Colors.white), // Daha fazla seçenekleri gösteren ikon
            color: Color(0xFF7D818C), // Buton rengi
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<int>>[
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text(
                    'SSS',
                    style:
                        TextStyle(color: Colors.white), // Seçenek metin rengi
                  ),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text(
                    'İletişim',
                    style:
                        TextStyle(color: Colors.white), // Seçenek metin rengi
                  ),
                ),
                const PopupMenuItem<int>(
                  value: 3,
                  child: Text(
                    'Çıkış yap',
                    style:
                        TextStyle(color: Colors.white), // Seçenek metin rengi
                  ),
                ),
              ];
            },
            onSelected: (int value) {
              // Seçilen seçeneğe göre işlem yapabilirsiniz.
              switch (value) {
                case 1:
                  // Seçenek 1 seçildiğinde yapılacak işlem
                  break;
                case 2:
                  // Seçenek 2 seçildiğinde yapılacak işlem
                  break;
                case 3:
                  // Seçenek 3 seçildiğinde yapılacak işlem
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                  break;
              }
            },
          )

          // IconButton.filled(
          //   style: ButtonStyle(),
          //   onPressed: () {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const LoginScreen(),
          //       ),
          //     );
          //   },
          //   icon: const Icon(Icons.logout),
          // )
        ],
      );
  Widget get carouselArea => SizedBox(
        width: double.maxFinite,
        height: dynamicHeight(0.25),
        child: PageView.builder(
          pageSnapping: true,
          itemCount: 3,
          allowImplicitScrolling: true,
          itemBuilder: (context, index) {
            return carouselCard;
          },
        ),
      );
  Widget get carouselCard => Padding(
        padding: const EdgeInsets.all(8.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [],
          ),
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Text(
                "Sadece İyilik Sağlık",
                style: themeData.textTheme.headlineLarge,
              ),
            ),
          ),
        ),
      );

  Widget get menuButtons => Column(
        children: [
          customMenuButton(
              "Günlük Sözler", Colors.accents[0].shade100, 0.1, 0.85),
          customMenuButton("Soru", Colors.accents[1].shade100, 0.1, 0.85),
          customMenuButton("Makale", Colors.accents[2].shade100, 0.1, 0.85),
          customMenuButton(
              "Departmanlar", Colors.accents[3].shade100, 0.1, 0.85),
        ],
      );

  Widget get bottomMenuButtons => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customMenuButton("Reklam", Colors.accents[4].shade100, 0.1, 0.40),
          customMenuButton(
              "Emeği Geçenler", Colors.accents[5].shade700, 0.1, 0.4),
        ],
      );
  Widget customMenuButton(String s, Color color, double height, double width) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Colors.blue,
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
}
