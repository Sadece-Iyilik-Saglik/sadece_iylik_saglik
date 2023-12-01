import 'package:flutter/material.dart';

import '../../../core/constants/app/color_strings.dart';

class CustomIconButtonLeftTop extends StatefulWidget {
  final VoidCallback onTap;
  final double? size;
  final Color? color;
  final String icon;
  final Color? iconColor;
  const CustomIconButtonLeftTop({
    required this.onTap,
    required this.icon,
    this.size,
    this.color,
    this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomIconButtonLeftTop> createState() =>
      _CustomIconButtonLeftTopState();
}

class _CustomIconButtonLeftTopState extends State<CustomIconButtonLeftTop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Container(
          height: widget.size ?? 40,
          alignment: Alignment.center,
          width: widget.size ?? 40,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: AppColor.kWhite,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
