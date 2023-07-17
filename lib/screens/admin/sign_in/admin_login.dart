import 'package:flutter/material.dart';

import 'components/body.dart';

class AdminLogin extends StatelessWidget {
  static String routeName = "/admin_login";

  const AdminLogin({super.key});
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
