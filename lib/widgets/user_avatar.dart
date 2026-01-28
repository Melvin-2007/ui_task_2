import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_6/config/app_assets.dart';
import 'package:task_6/config/app_colors.dart';

class UserAvatar extends StatelessWidget {
  final double size;
  const UserAvatar({super.key, this.size = 45.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.blue2),
      child: SvgPicture.asset(AppAssets.user, height: 35, width: 35),
    );
  }
}
