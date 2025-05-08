import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const pageId = "/splashscreen";

  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    changeScreen();

    super.initState();
  }

  changeScreen() async {
    Future.delayed( Duration(seconds: 3), () async {
      Get.toNamed(HomeScreen.pageId);
    }
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 214,
              height: 214,
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "assets/images/asdf.png",
              ),
            ),
          ),
        ],
      ),

      // Center(
      //
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         width: 150,
      //         height: 150,
      //         padding: EdgeInsets.all(8),
      //         child: Image.asset(
      //           "assets/images/asdf.png",
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
