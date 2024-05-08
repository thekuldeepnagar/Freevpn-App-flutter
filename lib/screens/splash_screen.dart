import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:vpn_basic_project/constant.dart';

import '../main.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      //exit full-screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      //navigate to home
      Get.off(() => HomeScreen());
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    //initializing media query (for getting device screen size)
    mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          //app logo
          Positioned(
              left: mq.width * .3,
              top: mq.height * .2,
              width: mq.width * .4,
              child: Image.asset('assets/images/logo.png',color: AppConstant.primarycolor,)),

          //label
          Positioned(
            left: mq.width * .43,
            top: mq.height * .27,
            width: mq.width * .4, // Adjust the position as needed
            child: Text(
              'VPN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
              bottom: mq.height * .15,
              width: mq.width,
              child: Text(
                'MADE IN INDIA',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppConstant.primarycolor.withOpacity(0.6), letterSpacing: 1),
              ))
        ],
      ),
    );
  }
}
