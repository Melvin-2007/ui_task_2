import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_6/config/app_assets.dart';
import 'package:task_6/config/app_colors.dart';
import 'package:task_6/widgets/app_bottom_nav_item.dart';

class AppBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onIndexChanged;
  const AppBottomNavBar({super.key, required this.selectedIndex, required this.onIndexChanged});
  
  static const List<String> icons = [AppAssets.chat, AppAssets.user, AppAssets.settings];
  static const List<String> labels = ["Chats", "Friends", "Settings"];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: MediaQuery.of(context).size.width,
      color: AppColors.white,
      child: ListView.builder(
        itemCount: labels.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: GestureDetector(
            onTap: () => onIndexChanged(index),
            child: AppBottomNavItem(iconPath: icons[index], isSelected: index == selectedIndex, label: labels[index]),
          ),
        ),
      ),
    );
  }
}
