import 'package:e_commerece_clon/compont/listtile.dart';
import 'package:e_commerece_clon/contans/app_image.dart';
import 'package:e_commerece_clon/provider/theme_provider.dart';
import 'package:e_commerece_clon/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("User Profile"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  child: Card(
                      color: const Color(0xffffffff),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(AppImagePng.person),
                            ),
                            wSpace(mWidth: 10),
                            Text(
                              "Mukesh Kachhawaha",
                              style: textStyleFonts18(context),
                            )
                          ],
                        ),
                      )),
                ),
                hSpace(),
                profileList(),
              ],
            ),
          ),
        ));
  }

  Widget profileList() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Setting",
            style: textStyleFonts16(context),
          ),
          hSpace(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.notification_add_sharp),
            title: Text(
              'Push Notification',
              style: textStyleFonts14(context),
            ),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {},
            ),
            // onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.light_mode_outlined),
            title: Text(
              'Theme',
              style: textStyleFonts14(context),
            ),
            trailing: Switch(
              value: Provider.of<ThemeProvider>(context).themeValue,
              onChanged: (bool value) {
                Provider.of<ThemeProvider>(context, listen: false).themeValue =
                    value;
              },
            ),
          ),
          hSpace(),
          Text(
            "Other",
            style: textStyleFonts16(context),
          ),
          hSpace(),
          CustomListTile(
            icons: const Icon(Icons.account_circle_outlined),
            text: "About Us",
            onTap: () {},
          ),
          CustomListTile(
            icons: const Icon(Icons.pin_drop_outlined),
            text: "Location",
            onTap: () {},
          ),
          CustomListTile(
            icons: const Icon(Icons.chat_outlined),
            text: "Terms & Condition",
            onTap: () {},
          ),
          CustomListTile(
            icons: const Icon(Icons.account_circle_outlined),
            text: "Privacy Policy",
            onTap: () {},
          ),
          CustomListTile(
            icons: const Icon(Icons.star_outline),
            text: "Rate your purchase",
            onTap: () {},
          ),
          CustomListTile(
            icons: const Icon(Icons.help_outline_rounded),
            text: "Help & Support",
            onTap: () {},
          ),
          CustomListTile(
            icons: const Icon(Icons.star_outline),
            text: "Rate the App",
            onTap: () {},
          ),
          CustomListTile(
            icons: const Icon(Icons.share_outlined),
            text: "Refer To Friend",
            onTap: () {},
          ),
          CustomListTile(
            icons: const Icon(Icons.language),
            text: "Change Language",
            onTap: () {},
          ),
          CustomListTile(
            icons: const Icon(Icons.logout),
            text: "Log Out",
            onTap: () {},
          )
        ],
      ),
    );
  }
}
