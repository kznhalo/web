import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kozarni_ecome/screen/home_screen.dart';
import 'package:colours/colours.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: "â­ HALO Fashion Star â­",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('''
            đ¸ 100% Brand New

            đ¸ Export Garment Factory Outlet

            đ¸ Trendy Export Quality Branded Clothing

            đ¸ Myanmar Famous Brand

            đ¸ Fair Price

            đ¸ Budget Clothes

            đ¸ Local Made

            đ¸ Deliver the whole Myanmar

            đ¸ Safe & Secure''',
                style: TextStyle(fontSize: 16),),
            ],
          ),

          image: buildImage('assets/1.jpeg'),
          decoration: getPageDecoration(),
        ),

        PageViewModel(
          title: '''â­ HALO Fashion Star â­ ááž 
          áá˝áąá¸áá˝áąá¸áá˝áŹ ááźá­áŻáá­áŻááŤáááş đš''',
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('''
          áĄáááşáĄáá˝áąá¸ááźááşáˇ 
          
          áĄáááşáĄáááş áĄáááşáá˝áąáá­áŻ 
          
          ááťáąá¸áážáŻááşá¸ááťá­áŻááŹáá˝áŹáá˛áˇ ááŻááşá¸ááąá¸ááŻáśá¸áááşá¸ 
          
          ááźááşááŹááźááşáĄáážáśáˇááž áááşáá°áá­áŻááşááŤááźáŽ đ
          
          Cash on Delivery or Online Payment 
          
          ( áĄá­ááşááąáŹááşáá˝áąááťáąááááş 
          
          áá­áŻáˇáááŻááş 
          
          áá˝áąááźá­áŻáá˝ážá˛ááááş ) â
          
          KBZ Mobile Banking 
          
          AYA Mobile Banking
          
          CB Mobile Banking
          
          YOMA Mobile Banking
          
          Kpay
          
          CB Pay
          
          AYA Pay
          
          Wave Pay 
         
          đł ááźá­áŻááşáá˛áˇ Online Payment áá˛áˇ áážááşá¸ 
          
          ááŻáśá¸ááĄáá­áŻáááşááąá¸áááŹááá­áŻáá˛áˇ  
          
          (0%) áááşááąáŹááşáážáŻ đ''',
                style: TextStyle(fontSize: 16),),
            ],
          ),

          image: buildImage('assets/2.jpeg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: "â­ HALO Fashion Star â­",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('''
              áĄáá­áŻ áĄá ááŽááąá¸ ááŽáááąá¸ 
              
              áŚá¸áŚá¸ ááąáŤáşááąáŤáş áá­áŻáˇáĄáá˝ááş
              
              ááąááşáá˛áˇ áĄááŽ 
              
              ááąáŹááşááŻáśá¸ááąáŤáş ááźááşááŹáážáŻ 
              
              áĄáááşááŽáá­áŻááşá¸áá˝áąááźááşáá˛áˇ 
              
              ááŻáá­áŻá¸á ááŻáśááťááş (ááá­ááş)á 
              
              áĄááşá¸ááťáŽá áá­áááşáá˛áˇ 
              
              áá­áŻáĄááşááŹáá˝áąáá­áŻ 
              
              áááşááŽ ááášááŹá¸ 
              
              HALO áážáŹ áážáŹáá°áá­áŻááşááŤááźáŽááąáŹáşâŚ''',
                style: TextStyle(fontSize: 16),),
            ],
          ),
          image: buildImage('assets/4.jpeg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'â­ HALO Fashion Star â­',
          body: ''' Fashion áĄáá˝ááşáá­áŻ 
          
          HALO Fashion Star áá­áŻááŹ 
          
          ááá­ááá­áŻááşááŤ! đš ''',
          footer: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ButtonWidget(
              text: "LET'S GET STARTED",
              onClicked: () => goToHome(context),
            ),
          ),
          image: buildImage('assets/3.jpeg'),
          decoration: getPageDecoration(),
        ),
      ],
      done: Text("", style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: Text('SKIP', style: TextStyle(fontSize: 16, color: Colors.indigo),),
      onSkip: () => goToHome(context),
      next: Icon(Icons.forward_outlined, size: 30, color: Colors.indigo),
      dotsDecorator: getDotDecoration(),
      onChange: (index) => print('Page $index selected'),
      globalBackgroundColor: Colors.white,
      skipFlex: 0,
      nextFlex: 0,
      // isProgressTap: false,
      // isProgress: false,
      // showNextButton: true,
      // freeze: true,
      // animationDuration: 1000,
    ),
  );

  void goToHome(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => HomeScreen()),
  );

  Widget buildImage(String path) =>
      Image.asset(path, width: double.infinity,
        height: double.infinity, fit: BoxFit.fitHeight, );

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: Colours.indigo,
    activeColor: Colours.gold,
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    bodyTextStyle: TextStyle(fontSize: 16,
    ),
    titleTextStyle: TextStyle(fontSize: 18,
        fontWeight: FontWeight.bold, color: Colors.black),
    titlePadding: EdgeInsets.only(top: 10),
    descriptionPadding: EdgeInsets.only(top: 20).copyWith(bottom: 0),
    pageColor: Colors.white,
  );
}


class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
    onPressed: onClicked,
    color: Colours.gold,
    shape: StadiumBorder(),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    child: Text(text,
      style: TextStyle(color: Colors.black, fontSize: 16),
    ),
  );
}