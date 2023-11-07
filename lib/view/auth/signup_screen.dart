import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sadece_iylik_saglik/core/base/state/base_state.dart';
import 'package:sadece_iylik_saglik/core/base/view/base_view.dart';
import 'package:sadece_iylik_saglik/core/model/user_model.dart';
import 'package:sadece_iylik_saglik/core/network/auth/auth.dart';
import 'package:sadece_iylik_saglik/view/auth/login_screen.dart';
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
                      labelText: "Ad",
                      obscureText: false,
                    ),
                    TextFieldCommon(
                      controller: surnameController,
                      iconData: Icons.person_outline_sharp,
                      labelText: "Soyad",
                      obscureText: false,
                    ),
                    TextFieldCommon(
                      controller: emailController,
                      iconData: Icons.email_outlined,
                      labelText: "E-mail",
                      obscureText: false,
                    ),
                    TextFieldCommon(
                      controller: passwordController,
                      iconData: Icons.fingerprint_outlined,
                      labelText: "Parola",
                      obscureText: false,
                    ),
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

  Widget get headArea => SizedBox(
        height: dynamicHeight(0.2),
        child: const Center(
          child: Image(
            image: NetworkImage(
              'https://akdeniz.edu.tr/assets/images/logo1.png',
            ),
            // image: NetworkImage(
            //   'https://instagram.fesb7-1.fna.fbcdn.net/v/t51.2885-19/325517073_582066547075061_3648101778798768242_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fesb7-1.fna.fbcdn.net&_nc_cat=105&_nc_ohc=sw4GO1Md33UAX-BqB4R&edm=ACWDqb8BAAAA&ccb=7-5&oh=00_AfAI-pf0uVhrVZhxxJEycucKmTX4n4hqUND0Zyc060WgGA&oe=654F14DF&_nc_sid=ee9879',
            // ),
            // height: size.height * 0.3,
          ),
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
            onPressed: registerUser, child: const Text("Kaydol")),
      ));

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
