import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_6/config/app_assets.dart';
import 'package:task_6/config/app_colors.dart';
import 'package:task_6/views/chat_view.dart';
import 'package:task_6/views/friends_view.dart';
import 'package:task_6/views/settings_view.dart';
import 'package:task_6/widgets/app_bottom_nav_bar.dart';
import 'package:task_6/widgets/custom_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late int index;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    index = tabController.index;
    tabController.addListener(() => tabViewListener());
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse}),
            child: TabBarView(controller: tabController, children: [ChatView(), FriendsView(), SettingsView()]),
          ),
          CustomAppBar(
            title: getTitle(),
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            leftIcon: GestureDetector(
              onTap: () {
                log("Edit text tapped");
              },
              child: Text(
                "Edit",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.blue),
              ),
            ),
            rightIcon: GestureDetector(
              onTap: () {
                log("Edit Button tapped");
              },
              child: SvgPicture.asset(
                AppAssets.edit,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: AppBottomNavBar(
              selectedIndex: index,
              onIndexChanged: (newIndex) {
                setState(() {
                  tabController.index = newIndex;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  String getTitle() {
    if (index == 0) {
      return "Chats";
    } else if (index == 1) {
      return "Friends";
    }
    return "Settings";
  }

  tabViewListener() {
    if (!tabController.indexIsChanging) {
      setState(() {
        index = tabController.index;
      });
    }
  }
}
