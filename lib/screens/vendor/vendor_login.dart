import 'package:flutter/material.dart';

import 'components/body.dart';

class VendorLogin extends StatelessWidget {
  static String routeName = "/vendor_login";

  const VendorLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: const Body(),
    );
  }
}
