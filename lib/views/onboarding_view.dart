import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_6/config/app_colors.dart';
import 'package:task_6/views/personalize_view.dart';
import 'package:task_6/widgets/app_button.dart';
import 'package:task_6/widgets/dot_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  List<String> images = [
    "https://images.unsplash.com/photo-1768641999760-6ba37484dd95?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw2NHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1768076644388-b42d2e7aea16?q=80&w=465&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1768321140168-fa4795cb03f8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw3OXx8fGVufDB8fHx8fA%3D%3D",
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 507,
            width: MediaQuery.of(context).size.width,
            child: ScrollConfiguration(
              behavior: ScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
              child: PageView.builder(
                itemCount: images.length,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.blueAccent,
                    child: Image.network(images[index], fit: BoxFit.cover),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DotIndicator(currentIndex: index),
                  SizedBox(height: 24),
                  Text(
                    'Create a prototype in just a few minutes',
                    style: GoogleFonts.inter(fontSize: 19, fontWeight: FontWeight.w800, color: AppColors.black),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Enjoy these pre-made components and worry only about creating the best product ever.',
                    style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.grey2),
                  ),
                  Spacer(),
                  AppButton(
                    label: "Next",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalizeView()));
                    },
                    isFilled: true,
                    labelColor: AppColors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
