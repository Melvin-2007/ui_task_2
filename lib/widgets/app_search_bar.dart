import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_6/config/app_assets.dart';
import 'package:task_6/config/app_colors.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColors.grey1, fontSize: 14, fontWeight: FontWeight.w400),
      cursorColor: AppColors.blue,
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(color: AppColors.grey5, fontSize: 14, fontWeight: FontWeight.w400),
        filled: true,
        fillColor: AppColors.blue2,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          // child: SvgPicture.asset(
          //   AppAssets.search,
          //   height: 16,
          //   width: 16,
          //   colorFilter: ColorFilter.mode(AppColors.black2, BlendMode.srcIn),
          // ),
          child: Icon(Icons.search, color: AppColors.black),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 16, minHeight: 16),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
      ),
    );
  }
}
