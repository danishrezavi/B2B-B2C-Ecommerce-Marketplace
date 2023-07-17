import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:shop_app/consts/consts.dart';
import 'package:shop_app/screens/order_screen/componenets/order_placed_details.dart';
import 'package:shop_app/screens/order_screen/componenets/order_status.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetailsScreen extends StatelessWidget {
  final dynamic data;
  const OrderDetailsScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Order Details".text.color(darkFontGrey).semiBold.make(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            orderStatus(
                color: redColor,
                icon: Icons.done,
                title: "Placed",
                showDone: data['order_placed']),
            orderStatus(
                color: Colors.blue,
                icon: Icons.thumb_up,
                title: "Confirmed",
                showDone: data['order_confirmed']),
            orderStatus(
                color: Colors.yellow,
                icon: Icons.car_repair,
                title: "On Delivery",
                showDone: data['order_on_delivery']),
            orderStatus(
                color: Colors.green,
                icon: Icons.done_all_rounded,
                title: "Deliverd",
                showDone: data['order_delivered']),
            const Divider(),
            10.heightBox,
            Column(
              children: [
                orderPlaceDetails(
                    title1: "Order Code",
                    title2: "Payment Method",
                    d1: data['order_code'],
                    d2: data['shipping_method']),
                orderPlaceDetails(
                    title1: "Order Date",
                    title2: "Payment Code",
                    d1: intl.DateFormat()
                        .add_yMEd()
                        .format(data['order_date'].toDate()),
                    d2: data['payment_method']),
                orderPlaceDetails(
                    title1: "Payment Status",
                    title2: "Delivery Status",
                    d1: "unpaid",
                    d2: "Order Placed"),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Shipping Address".text.semiBold.make(),
                          "${data['order_by_name']}".text.semiBold.make(),
                          "${data['order_by_email']}".text.semiBold.make(),
                          "${data['order_by_address']}".text.semiBold.make(),
                          "${data['order_by_city']}".text.semiBold.make(),
                          "${data['order_by_state']}".text.semiBold.make(),
                          "${data['order_by_phone']}".text.semiBold.make(),
                          "${data['order_by_postalcode']}".text.semiBold.make(),
                        ],
                      ),
                      SizedBox(
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Total Amount".text.semiBold.make(),
                            "${data['total_amount']}"
                                .text
                                .color(redColor)
                                .semiBold
                                .make(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ).box.outerShadowMd.white.make(),
            Divider(),
            10.heightBox,
            "Order Product"
                .text
                .size(16)
                .color(darkFontGrey)
                .semiBold
                .makeCentered(),
            10.heightBox,
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(data['orders'].length, (index) {
                return Column(
                  children: [
                    orderPlaceDetails(
                      title1: data['orders'][index]['title'].substring(0, 20),
                      title2: data['orders'][index]['tprice'],
                      d1: "${data['orders'][index]['qty']}x",
                      d2: "Refundable",
                    ),
                  ],
                );
              }).toList(),
            ).box.outerShadowMd.white.make(),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                "*You will be notified once the order status change"
                    .text
                    .size(13)
                    .semiBold
                    .color(darkFontGrey)
                    .makeCentered()
              ],
            ),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
