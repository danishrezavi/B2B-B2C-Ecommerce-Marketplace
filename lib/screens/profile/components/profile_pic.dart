import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_app/consts/consts.dart';
import 'package:shop_app/controllers/profile_controller.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imagePicker = Get.find<ProfileController>();
    return SizedBox(
      height: 115,
      width: 115,
      child: Obx(
        () => Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            imagePicker.profileImgPath.isEmpty
                ? Image.asset("assets/images/Pimage1.jpg",
                        width: 100, fit: BoxFit.cover)
                    .box
                    .roundedFull
                    .clip(Clip.antiAlias)
                    .make()
                : Image.file(File(imagePicker.profileImgPath.value),
                        width: 100, fit: BoxFit.cover)
                    .box
                    .roundedFull
                    .clip(Clip.antiAlias)
                    .make(),
            //CircleAvatar(
            //backgroundImage: AssetImage("assets/images/Pimage1.jpg"),
            //),
            Positioned(
              right: -16,
              bottom: 0,
              child: SizedBox(
                height: 46,
                width: 46,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Colors.white),
                    ),
                    backgroundColor: const Color(0xFFF5F6F9),
                  ),
                  onPressed: () {
                    imagePicker.changeImage(context);
                  },
                  child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
