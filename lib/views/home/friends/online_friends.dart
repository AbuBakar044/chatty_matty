import 'package:chatty_matty/utils/app_imports.dart';
import 'package:flutter/material.dart';

class OnlineFriends extends StatelessWidget {
  const OnlineFriends({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.put(FriendsController());
    return Container(
      child: Column(
        children: [
          SearchBar(),
          StreamBuilder(
            stream: FirebaseServices.fireStoreDB
                .collection(AppConstants.kUserCollection)
                .snapshots(),
            builder: (context, snapshots) {
              if (snapshots.connectionState == ConnectionState.waiting) {
                AppConstants.showLoading();
                return Center(child: MyText(text: 'Loading...'));
              } else if (!snapshots.hasData) {
                AppConstants.hideLoading();
                return Center(child: MyText(text: 'No Friends Found'));
              } else {
                AppConstants.hideLoading();
                homeCtrl.friendsList.value = snapshots.data!.docs
                    .map((e) => UserModel.fromJson(e))
                    .toList();
                return Expanded(
                  child: ListView.builder(
                    itemCount: homeCtrl.friendsList.length,
                    itemBuilder: (context, index) {
                      final user = homeCtrl.friendsList[index];
                      return ListTile(
                        //tileColor: AppColors.kGreenColor,
                        onTap: () {
                          homeCtrl.selectedUser.value = user;
                          Get.toNamed(RouteNames.kChat);
                        },
                        title: MyText(
                          text: user.name ?? '-',
                          size: 14,
                          weight: FontWeight.bold,
                          color: AppColors.kBlackColor,
                        ),
                        subtitle: MyText(
                          text: 'O kithy reh gya en',
                          color: AppColors.kGreyColor,
                          size: 12,
                        ),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(AppConstants.kLogoImage),
                        ),
                        trailing: MyText(
                          text: '12:57 PM',
                          color: AppColors.kGreyColor,
                          size: 11,
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
