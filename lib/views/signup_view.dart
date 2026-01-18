import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_6/config/app_colors.dart';
import 'package:task_6/widgets/app_button.dart';
import 'package:task_6/widgets/app_text_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign up',
              style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.black),
            ),
            Text(
              'Create an account to get started',
              style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grey2),
            ),
            SizedBox(height: 24),
            Text(
              'Name',
              style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.black),
            ),
            SizedBox(height: 8),
            AppTextField(hintText: "Name", isPassword: false),
            SizedBox(height: 16),
            Text(
              'Email Address',
              style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.black),
            ),
            SizedBox(height: 8),
            AppTextField(hintText: "name@email.com", isPassword: false),
            SizedBox(height: 16),
            Text(
              'Password',
              style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.black),
            ),
            SizedBox(height: 8),
            AppTextField(hintText: "Create a password", isPassword: true),
            SizedBox(height: 16),
            AppTextField(hintText: "Confirm password", isPassword: true),
            SizedBox(height: 16),
            Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(6),
                  onTap: () {},
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey3),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Wrap(
                    runSpacing: 0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        "I've read and agree with the ",
                        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grey2),
                      ),
                      AppButton(label: "Terms and", isFilled: false),
                      AppButton(label: "Conditions", isFilled: false),
                      Text(
                        " and the ",
                        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grey2),
                      ),
                      AppButton(label: "Privacy Policy.", isFilled: false),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            AppButton(label: "Sign up", isFilled: true, labelColor: AppColors.white),
          ],
        ),
      ),
    );
  }
}
