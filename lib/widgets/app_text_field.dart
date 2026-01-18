import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_6/config/app_assets.dart';
import 'package:task_6/config/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  const AppTextField({super.key, required this.hintText, required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      style: GoogleFonts.inter(color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w400),
      cursorColor: AppColors.blue,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintStyle: GoogleFonts.inter(color: AppColors.grey5, fontSize: 14, fontWeight: FontWeight.w400),
        filled: false,
        fillColor: AppColors.white,
        suffixIcon: isPassword
            ? Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: SvgPicture.asset(AppAssets.eye, height: 16, width: 16),
              )
            : null,
        suffixIconConstraints: BoxConstraints(minWidth: 16, minHeight: 16),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey1),
        ),
      ),
    );
  }
}
