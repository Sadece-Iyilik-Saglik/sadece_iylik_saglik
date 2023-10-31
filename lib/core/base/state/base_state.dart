import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);

  double dynamicHeight(double value) => MediaQuery.sizeOf(context).height * value;
  double dynamicWidth(double value) => MediaQuery.sizeOf(context).width * value;
}
