import 'package:chatty_matty/utils/app_imports.dart';
import 'package:chatty_matty/views/home/chats/chats.dart';
import 'package:chatty_matty/views/home/friends/online_friends.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          title: MyText(
            text: 'Chats',
            size: 30,
            weight: FontWeight.bold,
            color: AppColors.kWhiteColor,
          ),
          actions: [
            PopupMenuButton<String>(
              color: AppColors.kWhiteColor,
              surfaceTintColor: AppColors.kWhiteColor,
              iconColor: AppColors.kWhiteColor,
              onSelected: (value) {
                if (value == 'profile') {
                  print("Profile clicked");
                } else if (value == 'settings') {
                  print("Settings clicked");
                } else if (value == 'logout') {
                  print("Logout clicked");
                }
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(value: 'profile', child: Text('Profile')),
                  const PopupMenuItem(
                    value: 'settings',
                    child: Text('Settings'),
                  ),
                  const PopupMenuItem(value: 'logout', child: Text('Logout')),
                ];
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(Get.width, 60),
            child: TabBar(
              labelColor: AppColors.kWhiteColor,
              unselectedLabelColor: AppColors.kBlackColor,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(text: 'Chats'),
                Tab(text: 'Online Friends'),
              ],
            ),
          ),
        ),

        body: TabBarView(children: [Chats(), OnlineFriends()]),
      ),
    );
  }
}
