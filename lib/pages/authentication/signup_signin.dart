import 'package:flutter/material.dart';
import 'package:online_shop_dart/pages/authentication/sign_in.dart';
import 'package:online_shop_dart/pages/authentication/sign_up.dart';

class SignUpSignInPage extends StatefulWidget {
  const SignUpSignInPage({super.key});

  @override
  State<SignUpSignInPage> createState() => _SignUpSignInPageState();
}

class _SignUpSignInPageState extends State<SignUpSignInPage>
    with SingleTickerProviderStateMixin<SignUpSignInPage> {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(
                left: width * 0.2,
                right: width * 0.2,
                top: height * 0.05,
              ),
              width: width * 0.5,
              height: height * 0.08,
              decoration: BoxDecoration(
                  color: const Color(0xFF2b478a),
                  borderRadius: BorderRadius.circular(width * 0.04),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade800, blurRadius: 15),
                  ]),
              child: TabBar(
                controller: tabController,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                labelStyle: const TextStyle(fontFamily: "BYekan"),
                unselectedLabelColor: Colors.white54,
                tabs: const [
                  Text(
                    "ورود",
                  ),
                  Text(
                    "ثبت نام",
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: height * 0.05),
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    LogInPage(),
                    SignUpPage(),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
