import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/consts/consts.dart';

Widget ourButton({onpress, color, textcolor, title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: () {
      onpress;
    },
    child: title.text.color(textcolor).fontFamily(bold).make(),
  );
}
