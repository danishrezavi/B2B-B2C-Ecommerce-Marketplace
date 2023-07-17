import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/consts/consts.dart';
import 'package:shop_app/consts/list.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/cart/order_placed.dart';
import 'package:shop_app/widget_common/loading_indicator.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 60,
        // child: controller.placingOrder.value
        //     ? Center(
        //         child: loadingIndicator(),
        //       ) :
        child: DefaultButton(
          text: "Place Order",
          press: () async {
            await controller.placeMyOrder(
                orderPaymentMethod:
                    paymentMethods[controller.paymentIndex.value],
                totalAmount: controller.totalP.value);
            await controller.clearCart();
            //Get.to(() => const OrderPlaced());
            Get.offAll(const OrderPlaced());
          },
        ),
      ),
      appBar: AppBar(
        title: "Payment Method".text.color(darkFontGrey).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(
          () => Column(
            children: List.generate(paymentMethodImg.length, (index) {
              return GestureDetector(
                onTap: () {
                  controller.changePaymentIndex(index);
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: controller.paymentIndex.value == index
                              ? redColor
                              : Colors.transparent,
                          width: 4)),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image.asset(
                        paymentMethodImg[index],
                        width: double.infinity,
                        height: 130,
                        fit: BoxFit.cover,
                        colorBlendMode: controller.paymentIndex.value == index
                            ? BlendMode.darken
                            : BlendMode.color,
                        color: controller.paymentIndex.value == index
                            ? Colors.black.withOpacity(0.5)
                            : Colors.transparent,
                      ),
                      controller.paymentIndex.value == index
                          ? Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                  activeColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  value: true,
                                  onChanged: (value) {}),
                            )
                          : Container(),
                      paymentMethods[index].text.white.semiBold.size(16).make(),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
