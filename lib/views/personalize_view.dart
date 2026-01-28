import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_6/config/app_colors.dart';
import 'package:task_6/models/personalize_model.dart';
import 'package:task_6/views/chat_view.dart';
import 'package:task_6/widgets/app_back_button.dart';
import 'package:task_6/widgets/app_button.dart';
import 'package:task_6/widgets/app_check_box.dart';
import 'package:task_6/widgets/app_progress_bar.dart';

class PersonalizeView extends StatefulWidget {
  const PersonalizeView({super.key});

  @override
  State<PersonalizeView> createState() => _PersonalizeViewState();
}

class _PersonalizeViewState extends State<PersonalizeView> {
  late List<PersonalizeModel> personalizeList;

  @override
  void initState() {
    personalizeList = [
      PersonalizeModel(experience: "User Experience"),
      PersonalizeModel(experience: "User Research"),
      PersonalizeModel(experience: "UX Writing"),
      PersonalizeModel(experience: "User Testing"),
      PersonalizeModel(experience: "Service Design"),
      PersonalizeModel(experience: "Strategy"),
      PersonalizeModel(experience: "Design System"),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBackButton(),
            SizedBox(height: 16),
            AppProgressBar(
              total: personalizeList.length,
              completed: personalizeList.where((model) => model.isSelected).length,
            ),
            SizedBox(height: 24),
            Text(
              'Personalize your experience',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800, color: AppColors.black),
            ),
            SizedBox(height: 8),
            Text(
              'Choose your interests.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.grey2),
            ),
            SizedBox(height: 24),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final PersonalizeModel model = personalizeList[index];
                return AppCheckBox(
                  isChecked: model.isSelected,
                  label: model.experience,
                  onChanged: (value) {
                    setState(() {
                      model.isSelected = value;
                    });
                  },
                );
              },
              separatorBuilder: (context, _) => SizedBox(height: 16),
              itemCount: personalizeList.length,
            ),
            Spacer(),
            AppButton(
              label: "Next",
              isFilled: true,
              labelColor: AppColors.white,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatView())),
            ),
          ],
        ),
      ),
    );
  }
}
