import 'package:flutter/cupertino.dart';
import 'package:shop_app/consts/consts.dart';

Widget orderPlaceDetails({title1, title2, d1, d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "$title1".text.semiBold.size(15).make(),
            "$d1".text.color(redColor).semiBold.make()
          ],
        ),
        SizedBox(
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "$title2".text.semiBold.size(15).make(),
              "$d2".text.color(redColor).semiBold.make()
            ],
          ),
        ),
      ],
    ),
  );
}
