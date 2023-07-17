import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description, image;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.image,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    image: "assets/images/Item_1.png",
    images: [
      "assets/images/lrl1.jpg",
      "assets/images/lrl3.jpg",
      "assets/images/lrl5.jpg",
      "assets/images/lrl4.jpg",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Lauren Ralph Lauren Pascal Rug",
    price: 5064.99,
    description:
        "The Lauren Ralph Lauren Rug Collection is inspired by the lifestyles represented in Ralph Lauren Home couture rugs, but at a more moderate price point. LRL rugs offer home decorators a choice of iconic Ralph Lauren lifestyle looks that match their personal taste and style. This collection features hand-knotted, hand-loomed and Axminster weaves.",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    image: "assets/images/Item_2.png",
    images: [
      "assets/images/Item_2.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Sofa chair",
    price: 21000,
    description: "Comfortable, luxurious and stylish",
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    image: "assets/images/Item_3.png",
    images: [
      "assets/images/Item_3.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Bar stool chair",
    price: 9500.00,
    description: "Comfortable, luxurious and stylish",
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    image: "assets/images/Uttermost3.jpg",
    images: [
      "assets/images/Uttermost1.jpg",
      "assets/images/Uttermost2.jpg",
      "assets/images/Uttermost3.jpg",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Uttermost Gio Brass Table Clock",
    price: 20.20,
    description:
        "Industrial Feel Table Clock Finished In Antique Brushed Brass And Matte Black. The Neck Is Adjustable From 12.5 To 14 In Height. Quartz Movement Ensures Accurate Timekeeping. Requires One AA Battery.",
    rating: 4.1,
    isFavourite: false,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
