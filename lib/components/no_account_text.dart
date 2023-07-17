import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_up/sign_up_screen.dart';

import '../constants.dart';
import '../screens/admin/sign_in/admin_login.dart';
import '../screens/vendor/vendor_login.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don’t have an account? ",
              style: TextStyle(fontSize: getProportionateScreenWidth(16)),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    color: kPrimaryColor),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            Text(
              "Login as ",
              style: TextStyle(fontSize: getProportionateScreenWidth(16)),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, AdminLogin.routeName),
              child: Text(
                "Admin",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    color: kPrimaryColor),
              ),
            ),
            Text(
              " or ",
              style: TextStyle(fontSize: getProportionateScreenWidth(16)),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, VendorLogin.routeName),
              child: Text(
                "Vendor",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    color: kPrimaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}




    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Text(
    //       "Don’t have an account? ",
    //       style: TextStyle(fontSize: getProportionateScreenWidth(16)),
    //     ),
    //     GestureDetector(
    //       onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
    //       child: Text(
    //         "Sign Up",
    //         style: TextStyle(
    //             fontSize: getProportionateScreenWidth(16),
    //             color: kPrimaryColor),
    //       ),
    //     ),
    //   ],
    // );
