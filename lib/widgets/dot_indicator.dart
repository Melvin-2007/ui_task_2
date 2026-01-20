import 'package:flutter/material.dart';
import 'package:task_6/config/app_colors.dart';

class DotIndicator extends StatelessWidget {
  final int currentIndex;
  const DotIndicator({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 8,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == index ? AppColors.blue : AppColors.grey4,
            ),
          );
        },
        separatorBuilder: (context, _) => SizedBox(width: 4),
        itemCount: 3,
      ),
    );
  }
}
