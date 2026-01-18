import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_6/config/app_assets.dart';
import 'package:task_6/config/app_colors.dart';
import 'package:task_6/views/signup_view.dart';
import 'package:task_6/widgets/app_button.dart';
import 'package:task_6/widgets/app_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static List<String> socialMediaIcons = [AppAssets.googleIcon, AppAssets.appleIcon, AppAssets.facebookIcon];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/bg_image.png', height: 312, width: 468, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome!',
                    style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.black),
                  ),
                  SizedBox(height: 20),
                  AppTextField(hintText: "Email Address", isPassword: false),
                  SizedBox(height: 16),
                  AppTextField(hintText: "Password", isPassword: true),
                  SizedBox(height: 8),
                  AppButton(label: "Forgot password?", isFilled: false),
                  SizedBox(height: 16),
                  AppButton(label: "Login", isFilled: true, labelColor: AppColors.white, onTap: () {}),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member? ',
                        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grey2),
                      ),
                      AppButton(
                        label: "Register now",
                        isFilled: false,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupView()));
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Divider(thickness: 0.5, color: AppColors.grey4),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Or continue with',
                      style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grey2),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: ListView.separated(
                      itemBuilder: (context, index) => SvgPicture.asset(socialMediaIcons[index], height: 40, width: 40),
                      separatorBuilder: (context, _) => SizedBox(width: 8),
                      itemCount: socialMediaIcons.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
