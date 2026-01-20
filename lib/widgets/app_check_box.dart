import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_6/config/app_assets.dart';
import 'package:task_6/config/app_colors.dart';

class AppCheckBox extends StatelessWidget {
  final bool isChecked;
  final String label;
  final Function(bool value) onChanged;
  const AppCheckBox({super.key, required this.isChecked, required this.label, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: isChecked ? AppColors.blue2 : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isChecked ? Colors.transparent : AppColors.grey3, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.black2),
              ),
              if (isChecked) SvgPicture.asset(AppAssets.check, width: 16, height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
