import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_6/config/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget leftIcon;
  final Widget rightIcon;
  final EdgeInsets? padding;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.leftIcon,
    required this.rightIcon,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leftIcon,
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.black),
          ),
          rightIcon,
        ],
      ),
    );
  }
}
