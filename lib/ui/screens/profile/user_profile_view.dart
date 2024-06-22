import 'package:e_commerece_clon/compont/listtile.dart';
import 'package:e_commerece_clon/utils/ui_helper.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                  ),
                  wSpace(),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name : Mukesh Kachhawaha",
                          style: textStyleFonts16(context,
                              colors: const Color(0xffffffff)),
                          maxLines: 1,
                        ),
                        hSpace(),
                        Text(
                          "Email : mukeshkachhawah49@gmail.com",
                          style: textStyleFonts12(
                            context,
                            colors: const Color(0xffffffff),
                          ),
                          maxLines: 1,
                        ),
                        hSpace(),
                        Text(
                          "Phone : 7296826128",
                          style: textStyleFonts12(context,
                              colors: const Color(0xffffffff)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          hSpace(),
          profileList()
        ],
      ),
    );
  }

  Widget profileList() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          CustomListTile(
            icons: const Icon(Icons.account_circle_outlined),
            text: "My Profile",
            onTap: () {},
          ),
          CustomListTile(
            icons: const Icon(Icons.pin_drop_outlined),
            text: "Location",
            onTap: () {},
          ),
          CustomListTile(
            icons: const Icon(Icons.chat_outlined),
            text: "My Chat",
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
            icons: const Icon(Icons.more_vert),
            text: "Rate the App",
            onTap: () {},
          )
        ],
      ),
    );
  }
}
