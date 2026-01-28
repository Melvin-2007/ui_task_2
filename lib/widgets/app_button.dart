import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_6/config/app_colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final bool? isFilled;
  final Color? labelColor;
  final VoidCallback? onTap;
  const AppButton({
    super.key,
    required this.label,
    this.isFilled = false,
    this.labelColor = AppColors.blue,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("Button tapped");
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        height: isFilled == true ? 48 : null,
        width: isFilled == true ? double.infinity : null,
        padding: isFilled == false ? EdgeInsets.zero : null,
        alignment: isFilled == true ? Alignment.center : Alignment.centerLeft,
        decoration: BoxDecoration(
          color: isFilled == true ? AppColors.blue : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: labelColor),
        ),
      ),
    );
  }
}
