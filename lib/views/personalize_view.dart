import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_6/config/app_colors.dart';
import 'package:task_6/widgets/app_button.dart';
import 'package:task_6/widgets/app_check_box.dart';
import 'package:task_6/widgets/app_progress_bar.dart';

class PersonalizeView extends StatefulWidget {
  const PersonalizeView({super.key});

  @override
  State<PersonalizeView> createState() => _PersonalizeViewState();
}

class _PersonalizeViewState extends State<PersonalizeView> {
  List<String> experiences = [
    "User Interface",
    "User Experience",
    "User Research",
    "UX Writing",
    "User Testing",
    "Service Design",
    "Strategy",
    "Design System",
  ];

  List<int> selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppProgressBar(total: experiences.length, completed: selectedIndexes.length),
            SizedBox(height: 24),
            Text(
              'Personalize your experience',
              style: GoogleFonts.inter(fontSize: 21, fontWeight: FontWeight.w800, color: AppColors.black),
            ),
            SizedBox(height: 8),
            Text(
              'Choose your interests.',
              style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grey2),
            ),
            SizedBox(height: 24),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AppCheckBox(
                  isChecked: selectedIndexes.contains(index),
                  label: experiences[index],
                  onChanged: (isSelected) {
                    if (isSelected) {
                      setState(() {
                        selectedIndexes.add(index);
                      });
                    } else {
                      setState(() {
                        selectedIndexes.remove(index);
                      });
                    }
                  },
                );
              },
              separatorBuilder: (context, _) => SizedBox(height: 16),
              itemCount: experiences.length,
            ),
            Spacer(),
            AppButton(label: "Next", isFilled: true, labelColor: AppColors.white, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
