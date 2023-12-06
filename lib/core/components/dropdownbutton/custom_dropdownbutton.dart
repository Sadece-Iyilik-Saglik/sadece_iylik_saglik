// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final double? width;
  final void Function(dynamic)? onChanged;
  final String? hintText;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final Color? foregroundColor;
  final dynamic selectedValue;
  const CustomDropdownButton({
    Key? key,
    required this.items,
    this.width,
    this.onChanged,
    this.hintText,
    this.borderRadius,
    this.color,
    this.foregroundColor,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, borderRadius: borderRadius),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: width,
      child: DropdownButton(
        isExpanded: true,
        value: selectedValue,
        padding: EdgeInsets.zero,
        itemHeight: 48,
        hint: Text(hintText??"",style: TextStyle(color: foregroundColor),),
        borderRadius: BorderRadius.circular(5),
        dropdownColor: color,
        elevation: 0,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: foregroundColor,
        ),
        underline: const SizedBox.shrink(),
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
