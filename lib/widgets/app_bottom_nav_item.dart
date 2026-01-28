import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_6/config/app_colors.dart';

class AppBottomNavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSelected;
  const AppBottomNavItem({super.key, required this.iconPath, required this.isSelected, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconPath,
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(isSelected ? AppColors.blue : AppColors.grey4, BlendMode.srcIn),
        ),
        SizedBox(height: 8),
        Text(
          label,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 10,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? AppColors.black : AppColors.grey4,
          ),
        ),
      ],
    );
  }
}
