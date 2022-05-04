import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/widgets/login/login_flow.dart';

import '../../controller/home_controller.dart';

class LogOutUser extends StatelessWidget {
  const LogOutUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _controller = Get.find();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.only(top: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/shopping.jpeg",
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
          ),

          //This argument is not necessarily but to change widget flow
          Obx(() => LoginFlowWidget(authState: _controller.authState.value,))
        ],
      ),
    );
  }
}