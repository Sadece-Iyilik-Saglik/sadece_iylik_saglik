import 'package:flutter/material.dart';

class TextFieldCommon extends StatelessWidget {
  const TextFieldCommon({
    super.key,
    required this.controller,
    required this.iconData,
    required this.labelText,
    this.suffixIcon,
    this.obscureText,
  });

  final TextEditingController controller;
  final IconData iconData;
  final String labelText;
  final Widget? suffixIcon;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(iconData),
            border: const OutlineInputBorder(),
            labelText: labelText),
      ),
    );
  }
}
