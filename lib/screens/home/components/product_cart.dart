// import "package:flutter/material.dart";
// import 'package:shop_app/models/Product.dart';

// import '../../../constants.dart';

// class ProductCard extends StatelessWidget {
//   const ProductCard({
//     Key? key,
//     required this.itemIndex,
//     required this.product,
//     required this.press,
//   }) : super(key: key);

//   final int itemIndex;
//   final Product product;
//   final VoidCallback press;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: const EdgeInsets.symmetric(
//         horizontal: kDefaultPadding,
//         vertical: kDefaultPadding / 2,
//       ),
//       height: 160,
//       child: InkWell(
//         onTap: press,
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: <Widget>[
//             Container(
//               height: 136,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(22),
//                   color: itemIndex.isEven ? kBlueColor : kThirdColor,
//                   boxShadow: const [kDefaultShadow]),
//               child: Container(
//                 margin: const EdgeInsets.only(right: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(22),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 0,
//               right: 0,
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                 height: 160,
//                 width: 200,
//                 child: Image.asset(
//                   product.image,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               child: SizedBox(
//                 height: 136,
//                 // our image take 200 width, thats why we set out total width - 200
//                 width: size.width - 200,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     const Spacer(),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: kDefaultPadding),
//                       child: Text(
//                         product.title,
//                         style: Theme.of(context).textTheme.button,
//                       ),
//                     ),
//                     // it use the available space
//                     const Spacer(),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: kDefaultPadding * 1.5, // 30 padding
//                         vertical: kDefaultPadding / 4, // 5 top and bottom
//                       ),
//                       decoration: const BoxDecoration(
//                         color: kThirdColor,
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(22),
//                           topRight: Radius.circular(22),
//                         ),
//                       ),
//                       child: Text(
//                         "\$${product.price}",
//                         style: Theme.of(context).textTheme.button,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
