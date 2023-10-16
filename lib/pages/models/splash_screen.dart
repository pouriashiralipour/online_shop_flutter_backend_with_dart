import 'package:flutter/material.dart';
import 'package:online_shop_dart/home/home_screen.dart';
import 'package:online_shop_dart/pages/models/onboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const OnboardScreen()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.purple,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: height * 0.3),
              alignment: Alignment.topCenter,
              child: const CircleAvatar(
                maxRadius: 60,
                backgroundImage: AssetImage("assets/images/profile.JPG"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.05),
              child: Text(
                "MyOnlineShop",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: width * 0.065),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
