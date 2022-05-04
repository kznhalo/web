import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import '../../responsive_view/desktop_view.dart';
import '../../responsive_view/mobile_view.dart';
import '../../responsive_view/responsive_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveLayout(
        mobileBody: MobileView(),
    desktopBody: DesktopView(),



      // ListView(
      //           children: [
      //             // HomePickUp(),
      //             HomeCategory(),
      //             HomeItems(),
      //           ],
      //         ),
      ),
    );
  }
}
