import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_6/config/app_assets.dart';
import 'package:task_6/config/app_colors.dart';

class AppChatTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  const AppChatTextField({super.key, required this.controller, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w400),
      cursorColor: AppColors.blue,
      decoration: InputDecoration(
        hintText: "Type a message...",
        hintStyle: TextStyle(color: AppColors.grey5, fontSize: 14, fontWeight: FontWeight.w400),
        filled: true,
        fillColor: AppColors.blue2,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.blue),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SvgPicture.asset(AppAssets.send),
          ),
        ),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
      ),
    );
  }
}
