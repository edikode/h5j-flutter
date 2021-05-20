import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stikes_h5j/home_screen.dart';

import 'core/consts.dart';

class Splash extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<Splash> {
  @override
  void initState() {
    //set time to load the new page
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Mobile\nApplication H5J",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    color: AppColors.backColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
