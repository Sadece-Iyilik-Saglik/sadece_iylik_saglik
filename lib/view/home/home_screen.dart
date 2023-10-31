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
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ana Sayfa",
                  style: themeData.textTheme.headlineLarge,
                ),
                ElevatedButton.icon(
                    label: const Text("Çıkış Yap"),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                    icon: const Icon(Icons.logout))
              ],
            ),
          ),
        );
      },
    );
  }
}
