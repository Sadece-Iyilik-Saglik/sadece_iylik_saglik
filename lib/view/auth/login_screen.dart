import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sadece_iylik_saglik/core/base/view/base_view.dart';
import 'package:sadece_iylik_saglik/view/auth/signup_screen.dart';
import 'package:sadece_iylik_saglik/view/auth/widgets/login_header_widget.dart';
import 'package:sadece_iylik_saglik/view/auth/widgets/text_field_common.dart';
import 'package:sadece_iylik_saglik/view/home/home_screen.dart';
import '../../core/base/state/base_state.dart';
import 'forgot_password/model/forgot_password_model_bottom_sheet.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late dynamic size;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Widget _buildSuffixIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
      icon: _isPasswordVisible
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
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
                height: dynamicHeight(0.45),
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

  Widget get headArea => Padding(
        padding: const EdgeInsets.only(top: 40.0, bottom: 50),
        child: LoginHeaderWidget(
          size: size,
          showText: true,
        ),
      );
  // Text("Giriş Yap", style: themeData.textTheme.headlineLarge)
  Widget get emailTextField => TextFieldCommon(
        controller: emailController,
        iconData: Icons.email_outlined,
        labelText: 'E-mail',
        obscureText: false,
      );
  Widget get passwordTextField => TextFieldCommon(
        controller: passwordController,
        iconData: Icons.fingerprint,
        labelText: "Şifre",
        obscureText: !_isPasswordVisible,
        suffixIcon: _buildSuffixIcon(),
      );

  Widget get forgetButton => Container(
        width: dynamicWidth(1),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: TextButton(
            onPressed: () {
              ForgotPasswordScreen.buildShowModalBottomSheet(context);
            },
            child: const Text("Şifremi unuttum")),
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
                Image.asset(
                  "assets/images/google.png",
                ),
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
