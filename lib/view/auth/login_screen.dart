import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sadece_iylik_saglik/core/base/view/base_view.dart';
import 'package:sadece_iylik_saglik/view/auth/signup_screen.dart';
import 'package:sadece_iylik_saglik/view/home/home_screen.dart';
import '../../core/base/state/base_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              headArea,
              SizedBox(
                height: dynamicHeight(0.5),
                child: Column(
                  children: [
                    emailTextField,
                    passwordTextField,
                    forgetButton,
                    loginButton,
                    googleLoginButton,
                  ],
                ),
              ),
              registerArea
            ],
          ),
        ),
      );

  Widget get headArea => SizedBox(
      height: dynamicHeight(0.4), child: Center(child: Text("Giriş Yap", style: themeData.textTheme.headlineLarge)));

  Widget get emailTextField => Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: emailController,
          decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "E-mail"),
        ),
      );
  Widget get passwordTextField => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextField(
          controller: passwordController,
          decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Şifre"),
        ),
      );
  Widget get forgetButton => Container(
        width: dynamicWidth(1),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: TextButton(onPressed: () {}, child: const Text("Şifremi unuttum")),
      );
  Widget get loginButton => SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: CupertinoButton.filled(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false,
              );
            },
            child: const Text("Giriş Yap")),
      ));
  Widget get googleLoginButton => SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: CupertinoButton(
            onPressed: () {},
            color: Colors.blue.shade500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/google.png"),
                const Text("   Google ile Giriş Yap"),
              ],
            )),
      ));
  Widget get registerArea => SizedBox(
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Bir hesabın yok mu? "),
            TextButton(
                child: const Text("Kaydol"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ));
                }),
          ],
        ),
      );
}
