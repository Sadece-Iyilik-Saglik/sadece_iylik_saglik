import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: const AssetImage(
            'assets/images/logo/akdeniz_logo.png',
          ),
          height: size.height * 0.3,
        ),
        // Text(
        //   'Welcome Back',
        //   style: Theme.of(context).textTheme.headlineMedium,
        // ),
        Text(
          'Sadece iyilik sağlık topluluğu tarafından yapılmıştır',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
