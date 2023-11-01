import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sadece_iylik_saglik/core/base/state/base_state.dart';
import 'package:sadece_iylik_saglik/core/base/view/base_view.dart';
import 'package:sadece_iylik_saglik/core/model/user_model.dart';
import 'package:sadece_iylik_saglik/core/network/auth/auth.dart';
import 'package:sadece_iylik_saglik/view/auth/login_screen.dart';
import 'package:sadece_iylik_saglik/view/auth/widgets/login_header_widget.dart';
import 'package:sadece_iylik_saglik/view/auth/widgets/text_field_common.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends BaseState<SignupScreen> {
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late dynamic size;

  @override
  void initState() {
    nameController = TextEditingController();
    surnameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

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
              headArea,
              SizedBox(
                height: dynamicHeight(0.8),
                child: Column(
                  children: [
                    TextFieldCommon(
                        controller: nameController,
                        iconData: Icons.person,
                        labelText: "Ad"),
                    TextFieldCommon(
                        controller: surnameController,
                        iconData: Icons.person_outline_sharp,
                        labelText: "Soyad"),
                    TextFieldCommon(
                        controller: emailController,
                        iconData: Icons.email_outlined,
                        labelText: "E-mail"),
                    TextFieldCommon(
                        controller: passwordController,
                        iconData: Icons.fingerprint_outlined,
                        labelText: "Parola"),
                    loginButton,
                    googleRegisterButton,
                    loginArea,
                  ],
                ),
              )
            ],
          ),
        ),
      );

  PreferredSizeWidget get appBar => AppBar();

  Widget get headArea => Padding(
        padding: const EdgeInsets.all(30.0),
        child: LoginHeaderWidget(
          size: size * 0.6,
          showText: false,
        ),
      );

  Widget customController(TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        decoration:
            InputDecoration(border: const OutlineInputBorder(), hintText: hint),
      ),
    );
  }

  Widget get loginButton => SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CupertinoButton.filled(
            onPressed: registerUser,
            child: const Text("Kaydol"),
          ),
        ),
      );

  Function() get registerUser => () {
        if (nameController.text.isNotEmpty &&
            surnameController.text.isNotEmpty &&
            emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          // Kullanıcı Kaydetme Fonksiyonu
          Auth().createUserWithEmailAndPassword(
              user: User(
                  name: nameController.text,
                  surname: surnameController.text,
                  email: emailController.text,
                  password: passwordController.text));
          // Başarıyla tamamlandığında çıkan Snackbar
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Kaydolma işlemi başarıyla tamamlandı"),
            backgroundColor: Colors.green,
          ));
          //Giriş Yapma Ekranına yönlendir
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
        } else {
          // Hata verdiğinde çıkan Snackbar
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Girilen bilgilerde hata var !!!"),
            backgroundColor: Colors.orange,
          ));
        }
      };

  Widget get googleRegisterButton => SizedBox(
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
                const Text("   Google ile Kaydol"),
              ],
            )),
      ));
  Widget get loginArea => SizedBox(
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Zaten bir hesabın var mı? "),
            TextButton(
                child: const Text("Giriş Yap"),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                }),
          ],
        ),
      );
}
