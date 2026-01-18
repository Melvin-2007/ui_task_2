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
    return TextButton(
      onPressed: () {
        log("Button tapped");
        if (onTap != null) {
          onTap!();
        }
      },
      style: ButtonStyle(
        minimumSize: isFilled == true ? WidgetStateProperty.all<Size>(Size(double.infinity, 48)) : null,
        padding: isFilled == false ? WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero) : null,
        backgroundColor: isFilled == true ? WidgetStateProperty.all<Color>(AppColors.blue) : null,
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: labelColor),
      ),
    );
  }
}
