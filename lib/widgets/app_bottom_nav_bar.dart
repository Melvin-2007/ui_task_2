import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_6/config/app_assets.dart';
import 'package:task_6/config/app_colors.dart';
import 'package:task_6/widgets/app_bottom_nav_item.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBottomNavItem(iconPath: AppAssets.chat, isSelected: true, label: "Chats"),
          AppBottomNavItem(iconPath: AppAssets.user, isSelected: false, label: "Friends"),
          AppBottomNavItem(iconPath: AppAssets.settings, isSelected: false, label: "Settings"),
        ],
      ),
    );
  }
}
