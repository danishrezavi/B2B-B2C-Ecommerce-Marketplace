import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/consts/consts.dart';
import 'package:shop_app/controllers/profile_controller.dart';
import 'package:shop_app/screens/profile/components/profile_pic.dart';
import 'package:shop_app/services/firestore_services.dart';
import 'package:shop_app/widget_common/custom_texrfield.dart';

import '../../../size_config.dart';

class EditProfileScreen extends StatelessWidget {
  static String routeName = "/editProfileScreen";
  final dynamic data;

  const EditProfileScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    // controller.nameController.text = data['name'];
    // controller.passController.text = data['password'];

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: "Edit Profile".text.color(darkFontGrey).make(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.heightBox,
            const ProfilePic(),
            const Divider(),
            20.heightBox,
            customTextField(
              controller: controller.nameController,
              hint: controller.nameController.text,
              title: name,
            ),
            customTextField(
              controller: controller.passController,
              hint: controller.passController.text,
              title: oldpass,
            ),
            10.heightBox,
            customTextField(
              controller: controller.newpassController,
              hint: passwordHint,
              title: newpass,
            ),
            10.heightBox,
            controller.isloading.value
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  )
                : SizedBox(
                    width: SizeConfig.screenWidth * 0.4,
                    child: DefaultButton(
                      text: "Save",
                      press: () async {
                        controller.isloading(true);

                        if (controller.profileImgPath.value.isNotEmpty) {
                          await controller.uploadProfileImage();
                        } else {
                          controller.profileImageLink = data['imageUrl'];
                        }

                        if (data['password'] ==
                            controller.passController.text) {
                          await controller.changeAuthPassword(
                              email: data['email'],
                              password: controller.passController.text,
                              newpassword: controller.newpassController.text);

                          await controller.updateProfile(
                              imgUrl: controller.profileImageLink,
                              name: controller.nameController.text,
                              password: controller.newpassController.text);
                          VxToast.show(context, msg: 'Updated');
                        } else {
                          VxToast.show(context, msg: "Wrong Old Password");
                          controller.isloading(false);
                        }
                      },
                    ),
                  ),
          ],
        )
            .box
            .white
            .shadow
            .padding(const EdgeInsets.all(16))
            .margin(
                const EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 50))
            .rounded
            .make(),
      ),
    );
  }
}
