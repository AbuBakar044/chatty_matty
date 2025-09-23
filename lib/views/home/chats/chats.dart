import 'package:chatty_matty/utils/app_imports.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 20),
              child: SearchBar(
                elevation: WidgetStatePropertyAll(0),
                hintText: 'Search chat...',
                leading: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    //tileColor: AppColors.kGreenColor,
                    onTap: () {},
                    title: MyText(
                      text: 'User Name',
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
            ),
          ],
        ),
      ),
    );
  }
}
