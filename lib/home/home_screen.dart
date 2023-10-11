import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});
  final String title;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activeTab = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF2b478a),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: width,
            height: height,
            // color: Colors.white,
            child: ListView(
              children: [
                Container(
                  // color: Colors.red,
                  height: height * 0.11,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'فروشگاه من',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.07,
                                fontFamily: 'BYekan',
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          child: Icon(
                            Icons.menu,
                            size: width * 0.07,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  constraints: BoxConstraints(minHeight: height * 0.07),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white30),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.white38,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            size: width * 0.08,
                          ),
                          hintStyle: const TextStyle(color: Colors.black87),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  const BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  const BorderSide(color: Colors.transparent))),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.06,
                  constraints: BoxConstraints(minHeight: height * 0.06),
                  margin: EdgeInsets.only(
                      top: height * 0.03,
                      right: width * 0.05,
                      left: width * 0.05),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            activeTab = index;
                          });
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          margin: EdgeInsets.all(height * 0.005),
                          width: width * 0.2,
                          height: height * 0.12,
                          decoration: BoxDecoration(
                              color: activeTab == index
                                  ? Colors.white30
                                  : Colors.transparent,
                              borderRadius:
                                  BorderRadius.circular(height * 0.03)),
                          child: Center(
                            child: Text(
                              index == 0 ? 'همه' : "دسته$index",
                              style: TextStyle(
                                  fontFamily: 'BYekan',
                                  color: activeTab == index
                                      ? Colors.black54
                                      : Colors.white,
                                  fontSize: width * 0.05),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 7,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: height * 0.03,
                      right: width * 0.05,
                      left: width * 0.05),
                  height: height * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width * 0.08),
                        topRight: Radius.circular(width * 0.08)),
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        width: width * 0.5,
                        height: height * 0.17,
                        margin: EdgeInsets.only(
                            top: height * 0.03,
                            left: width * 0.06,
                            right: width * 0.06),
                        decoration: BoxDecoration(
                            color: index.isEven
                                ? Colors.red[200]
                                : const Color(0xFF7c9998),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: width * 0.035,
                              )
                            ],
                            borderRadius: BorderRadius.circular(width * 0.08)),
                        child: Stack(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                  right: width * 0.008,
                                ),
                                // top: width * 0.005,
                                // bottom: width * 0.005),
                                width: width,
                                height: height,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(width * 0.08),
                                      bottomRight:
                                          Radius.circular(width * 0.08)),
                                )),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: width * 0.25,
                                    height: height * 0.15,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'assets/images/shirt.jpg'))),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            child: Text(
                                          'پیراهن$index',
                                          style: TextStyle(
                                              fontFamily: 'BYekan',
                                              fontSize: width * 0.05,
                                              color: const Color(0xFF2b478a)),
                                        )),
                                        Container(
                                          child: Text(
                                            'دسته بندی$index',
                                            style: TextStyle(
                                                fontFamily: 'BYekan',
                                                fontSize: width * 0.05),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '85000',
                                            style: TextStyle(
                                                fontFamily: 'BYekan',
                                                fontSize: width * 0.05,
                                                color: index.isEven
                                                    ? Colors.red[200]
                                                    : const Color(0xFF7c9998)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: 7,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
