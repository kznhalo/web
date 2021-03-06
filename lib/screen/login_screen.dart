import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/widgets/login/logout_user_widget.dart';

import '../data/constant.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        title: Text(
          "HALO Fashion Star",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: appBarTitleColor,
              wordSpacing: 2,
          letterSpacing: 1),
        ),
        elevation: 0,
        backgroundColor: detailBackgroundColor,
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back,
            color: appBarTitleColor,
          ),
        ),
      ),
      body: LogOutUser(),
    );
  }
}
