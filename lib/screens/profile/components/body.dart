import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/consts/consts.dart';
import 'package:shop_app/controllers/auth_controller.dart';
import 'package:shop_app/controllers/profile_controller.dart';
import 'package:shop_app/screens/chat_screen/messaging_screen.dart';
import 'package:shop_app/screens/order_screen/order_screen.dart';
import 'package:shop_app/screens/profile/components/details_cart.dart';
import 'package:shop_app/screens/profile/components/edit_profile.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/screens/wishlist/wishlist.dart';
import 'package:shop_app/services/firestore_services.dart';
import 'package:shop_app/widget_common/loading_indicator.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: StreamBuilder(
        stream: FirestoreServices.getUser(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else {
            var data = snapshot.data!.docs[0];

            return Column(
              children: [
                const ProfilePic(),
                const SizedBox(height: 10),
                "${data['name']}".text.fontFamily(semibold).black.make(),
                "${data['email']}".text.black.make(),
                const SizedBox(height: 30),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     detailsCard(
                //         count: "${data['cart_count']}",
                //         title: "Your cart",
                //         width: context.screenWidth / 3.3),
                //     detailsCard(
                //         count: "${data['wishlist_count']}",
                //         title: "Your Wishlist",
                //         width: context.screenWidth / 3.3),
                //     detailsCard(
                //         count: "${data['order_count']}",
                //         title: "Your Orders",
                //         width: context.screenWidth / 3.3),
                //   ],
                // ),

                FutureBuilder(
                    future: FirestoreServices.getCounts(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: loadingIndicator());
                      } else {
                        var countData = snapshot.data;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            detailsCard(
                                count: countData[0].toString(),
                                title: "Your cart",
                                width: context.screenWidth / 3.3),
                            detailsCard(
                                count: countData[1].toString(),
                                title: "Your Wishlist",
                                width: context.screenWidth / 3.3),
                            detailsCard(
                                count: countData[2].toString(),
                                title: "Your Orders",
                                width: context.screenWidth / 3.3),
                          ],
                        );
                      }
                    }),

                const SizedBox(height: 20),
                ProfileMenu(
                  text: "My Orders",
                  icon: "assets/icons/User Icon.svg",
                  press: () => {Get.to(() => const OrderScreen())},
                ),
                ProfileMenu(
                  text: "My WishList",
                  icon: "assets/icons/Bell.svg",
                  press: () => {Get.to(() => const WishlistScreen())},
                ),
                ProfileMenu(
                  text: "Settings",
                  icon: "assets/icons/Settings.svg",
                  press: () {
                    controller.nameController.text = data['name'];
                    controller.passController.text = data['password'];
                    Get.to(() => EditProfileScreen(data: data));
                  },
                ),
                ProfileMenu(
                  text: "Messages",
                  icon: "assets/icons/Question mark.svg",
                  press: () => {Get.to(() => const MessagesScreen())},
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: "assets/icons/Log out.svg",
                  press: () async {
                    await Get.put(AuthController()).signoutMethod(context);
                    Navigator.pushNamed(context, SplashScreen.routeName);
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
