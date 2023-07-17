import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/consts/consts.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/cart/shipping_screen.dart';
import 'package:shop_app/services/firestore_services.dart';
import 'package:shop_app/widget_common/loading_indicator.dart';

class NewCartScreen extends StatelessWidget {
  const NewCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Shopping cart".text.color(darkFontGrey).semiBold.make(),
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getCart(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: "Cart is Empty".text.color(darkFontGrey).make(),
              );
            } else {
              var data = snapshot.data!.docs;
              controller.calculate(data);
              controller.productSnapshot = data;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Image.network(
                                "${data[index]['img']}",
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                              title:
                                  "${data[index]['title']} (x${data[index]['qty']})"
                                      .text
                                      .semiBold
                                      .size(16)
                                      .make(),
                              subtitle: "${data[index]['tprice']}"
                                  .numCurrency
                                  .text
                                  .semiBold
                                  .color(redColor)
                                  .make(),
                              trailing:
                                  const Icon(Icons.delete, color: redColor)
                                      .onTap(() {
                                FirestoreServices.deleteDocumnt(data[index].id);
                              }),
                            );
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Total Price".text.semiBold.color(darkFontGrey).make(),
                        "${controller.totalP.value}"
                            .numCurrency
                            .text
                            .semiBold
                            .color(redColor)
                            .make(),
                        // Obx(
                        //   () => "${controller.totalP.value}"
                        //       .numCurrency
                        //       .text
                        //       .semiBold
                        //       .color(redColor)
                        //       .make(),
                        // ),
                      ],
                    )
                        .box
                        .padding(const EdgeInsets.all(12))
                        .color(lightGrey)
                        .width(context.screenWidth - 60)
                        .roundedSM
                        .make(),
                    10.heightBox,
                    SizedBox(
                      width: context.screenWidth - 60,
                      child: DefaultButton(
                        text: "Proceed to Shipping ",
                        press: () {
                          Get.to(() => const ShippingDetails());
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.cart),
    );
  }
}
