import 'package:flutter/material.dart';
import 'package:shop_app/consts/consts.dart';
import 'package:shop_app/widget_common/bg_widget.dart';

class ProfilePage extends StatelessWidget {
  static String routeName = "/profilepage";

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make(),
                  10.widthBox,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Dummy Name".text.fontFamily(semibold).black.make(),
                      "user@homedecor.com".text.black.make(),
                    ],
                  )),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: whiteColor,
                    ),
                    onPressed: () {},
                    child: logout.text.fontFamily(semibold).black.make(),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
