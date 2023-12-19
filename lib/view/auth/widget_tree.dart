import 'package:flutter/material.dart';

import '../../core/network/firebase/auth.dart';
import '../home/home_screen.dart';
import 'login_screen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return const HomeScreen();
        }else{
          return const LoginScreen();
        }
      },
    );
  }
}
