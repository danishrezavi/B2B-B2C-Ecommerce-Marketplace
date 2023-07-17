import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/consts/consts.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/screens/cart/payment_method.dart';
import 'package:shop_app/widget_common/custom_texrfield.dart';
import 'package:shop_app/widget_common/our_button.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shipping Details".text.semiBold.color(darkFontGrey).make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: DefaultButton(
          text: "Continue ",
          press: () {
            if (controller.addressController.text.length > 10) {
              Get.to(() => const PaymentMethods());
            } else {
              VxToast.show(context, msg: "Please Provide address");
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            customTextField(
                hint: "Address",
                title: "Address",
                controller: controller.addressController),
            customTextField(
                hint: "City",
                title: "City",
                controller: controller.cityController),
            customTextField(
                hint: "State",
                title: "State",
                controller: controller.stateController),
            customTextField(
                hint: "Postal Code",
                title: "Postal Code",
                controller: controller.postalcodeController),
            customTextField(
                hint: "Phone",
                title: "Phone",
                controller: controller.phoneController),
          ],
        ),
      ),
    );
  }
}
