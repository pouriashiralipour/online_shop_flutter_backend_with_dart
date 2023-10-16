import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      int nextPage = pageController.page!.round();
      if (currentPage != nextPage) {
        setState(() {
          currentPage = nextPage;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: height * 0.15),
                width: width * 0.25,
                height: height * 0.13,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.blueGrey.shade800, width: 2.5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF7c9998),
                      blurRadius: 20,
                    )
                  ],
                  shape: BoxShape.circle,
                  color: Colors.indigoAccent,
                  image: const DecorationImage(
                      image: AssetImage("assets/images/profile.JPG"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: height * 0.32),
                padding: EdgeInsets.all(width * 0.02),
                decoration: BoxDecoration(
                    color: const Color(0xFF2b478a),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "پوریا شیرالی پور",
                  style: TextStyle(
                      fontFamily: "BYekan",
                      fontSize: width * 0.04,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: width,
                height: height * 0.5,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    bool active = index == currentPage;
                    return buildPage(active, index, width, height);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage(bool active, int index, var width, var height) {
    final double top = active == true ? 100 : 200;
    final Color shadow =
        active == true ? const Color(0xFF2b478a) : Colors.grey.withOpacity(0.6);
    final double blur = active == true ? 25 : 5;
    final double offset = active == true ? 8 : 5;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.only(
        top: top,
        bottom: 50,
        left: 15,
        right: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: shadow,
            blurRadius: blur,
            offset: Offset(offset, offset),
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: height * 0.03),
              width: width * 0.35,
              height: width * 0.35,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/shirt.jpg"),
              )),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: height * 0.14),
              child: Text(
                "پیراهن $index",
                style: const TextStyle(
                  fontFamily: "BYekan",
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: height * 0.02),
              child: Text(
                "$index",
                style: const TextStyle(fontFamily: "BYekan"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
