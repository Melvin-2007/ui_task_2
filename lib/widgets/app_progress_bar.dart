import 'package:flutter/material.dart';
import 'package:task_6/config/app_colors.dart';

class AppProgressBar extends StatelessWidget {
  final int total;
  final int completed;
  const AppProgressBar({super.key, required this.total, required this.completed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 8,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: AppColors.blue2, borderRadius: BorderRadius.circular(4)),
        ),
        Container(
          height: 8,
          width: (MediaQuery.of(context).size.width / total) * completed,
          decoration: BoxDecoration(color: AppColors.blue, borderRadius: BorderRadius.circular(4)),
        ),
      ],
    );
  }
}
