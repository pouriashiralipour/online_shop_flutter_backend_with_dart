import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:online_shop_dart/home/home_screen.dart';
import 'package:online_shop_dart/pages/authentication/signup_signin.dart';
import 'package:online_shop_dart/pages/models/splash_screen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: IntroViewsFlutter(
          [
            PageViewModel(
                body: SizedBox(
                  width: width,
                  height: height,
                  child: const Text("data1"),
                ),
                pageColor: Colors.purple,
                title: const Text("Page1"),
                mainImage: Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                  size: width * 0.3,
                )),
            PageViewModel(
                body: SizedBox(
                  width: width,
                  height: height,
                  child: const Text("data2"),
                ),
                pageColor: Colors.redAccent,
                title: const Text("Page2"),
                mainImage: Icon(
                  Icons.hotel_class_rounded,
                  color: Colors.white,
                  size: width * 0.3,
                )),
          ],
          doneText: const Text(
            "فهمیدم",
            style: TextStyle(color: Colors.white, fontFamily: "BYekan"),
          ),
          skipText: const Text("رد کن...",
              textDirection: TextDirection.rtl,
              style: TextStyle(color: Colors.white, fontFamily: "BYekan")),
          onTapDoneButton: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const SignUpSignInPage(),
            ));
          },
        ),
      ),
    );
  }
}
