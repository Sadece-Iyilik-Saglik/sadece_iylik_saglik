import 'package:flutter/material.dart';

import 'package:sadece_iylik_saglik/core/viewmodel/onboarding_view_model.dart';
// ignore: unused_import
import 'package:sadece_iylik_saglik/view/auth/login_screen.dart';
import 'package:sadece_iylik_saglik/view/auth/signup_screen.dart';
import 'package:sadece_iylik_saglik/view/home/home_screen.dart';

import '../../core/base/view/base_view.dart';
import '../../core/constants/app/color_strings.dart';
import 'components/card_customized.dart';
import 'components/custom_icon_button_left_top.dart';
import 'components/custom_indicator.dart';
import 'components/primary_button_customized.dart';
import 'components/text_button_customized.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({
    super.key,
  });

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late dynamic size;

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
        backgroundColor: AppColor.kWhite,
        extendBodyBehindAppBar: true,
        appBar: _currentIndex > 0 ? appBar : null,
        body: Column(
          children: [
            imageCard,
            const SizedBox(height: 40),
            Expanded(
              child: onboardingCardPageBuilder,
            ),
            customIndicator,
            const SizedBox(height: 30),
            primaryButton,
            customTextButton,
            const SizedBox(height: 50),
          ],
        ),
      );

  PreferredSizeWidget get appBar => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.all(7),
          child: CustomIconButtonLeftTop(
            onTap: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            icon: '',
          ),
        ),
      );

  Widget get imageCard {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        const WaveCard(),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Image.asset(OnBoardingViewModel.onboardingList[_currentIndex].image),
        ),
      ],
    );
  }

  Widget get onboardingCardPageBuilder {
    return PageView.builder(
      controller: _pageController,
      itemCount: OnBoardingViewModel.onboardingList.length,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      itemBuilder: (context, index) {
        return OnboardingCard(
          onboarding: OnBoardingViewModel.onboardingList[index],
        );
      },
    );
  }

  Widget get customIndicator {
    return CustomIndicator(
      controller: _pageController,
      dotsLength: OnBoardingViewModel.onboardingList.length,
    );
  }

  Widget get primaryButton {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PrimaryButton(
        onTap: () {
          if (_currentIndex == (OnBoardingViewModel.onboardingList.length - 1)) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignupScreen(),
              ),
            );
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }
        },
        text: _currentIndex == (OnBoardingViewModel.onboardingList.length - 1) ? 'Kayıt ol' : 'Sonraki',
      ),
    );
  }

  Widget get customTextButton {
    return CustomTextButton(
      onPressed: () {
        //Geçiçi olarak geliştirme yaparken test için direkt olarak ana sayfaya yönlendiriyor.
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
        // _currentIndex == (OnBoardingViewModel.onboardingList.length - 1)
        //     ? Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const LoginScreen(),
        //         ),
        //       )
        //     : _pageController.jumpToPage(OnBoardingViewModel.onboardingList.length - 1);
      },
      text: _currentIndex == (OnBoardingViewModel.onboardingList.length - 1) ? 'Giriş yap' : 'Atla',
    );
  }
}
