import 'package:flutter/material.dart';
import 'package:shop_app/components/product_cardlist.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/home/components/product_list.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
// import 'product_cart.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            //const DiscountBanner(),
            //const Categories(),
            const SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            const PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),

            const ProductList(),

            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: const ClampingScrollPhysics(),
            //   itemCount: demoProducts.length,
            //   itemBuilder: (context, index) => ProductCard(
            //     itemIndex: index,
            //     product: demoProducts[index],
            //     press: () => Navigator.pushNamed(
            //       context,
            //       DetailsScreen.routeName,
            //       arguments:
            //           ProductDetailsArguments(product: demoProducts[index]),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
