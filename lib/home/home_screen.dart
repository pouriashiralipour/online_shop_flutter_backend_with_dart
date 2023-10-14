import 'package:flutter/material.dart';
import 'package:online_shop_dart/pages/cart/cart.dart';
import 'package:online_shop_dart/pages/models/info.dart';
import 'package:online_shop_dart/pages/models/item_details.dart';
import 'package:online_shop_dart/pages/models/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});
  final String title;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<ScaffoldState> state = GlobalKey();
  bool isOpenDrawer = false;
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
      key: state,
      endDrawer: Container(
        width: width * 0.3,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 1),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            drawerItem(1, height, width, Icons.person_2_outlined),
            drawerItem(2, height, width, Icons.shopping_cart_outlined),
            drawerItem(3, height, width, Icons.info_outline),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF2b478a),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: width,
            height: height,
            // color: Colors.white,
            child: ListView(
              children: [
                SizedBox(
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
                        InkWell(
                          onTap: () {
                            if (state.currentState!.isDrawerOpen) {
                              Navigator.of(context).pop();
                            } else {
                              state.currentState!.openEndDrawer();
                            }
                          },
                          child: Container(
                            child: Icon(
                              Icons.menu,
                              size: width * 0.07,
                              color: Colors.white,
                            ),
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
                        child: AnimatedContainer(
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 600),
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
                              index == 0 ? 'همه' : "دسته $index",
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
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                productName: "Shirt$index",
                                productCategory: "Category$index",
                                productPrice: "80\$",
                              ),
                            ));
                          },
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
                                                      : const Color(
                                                          0xFF7c9998)),
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

  Widget drawerItem(int id, var height, var width, IconData icon) {
    return InkWell(
      onTap: () {
        if (id == 1) {
          Navigator.of(context).pop();

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ProfilePage(),
          ));
        } else if (id == 2) {
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Cart(),
          ));
        } else {
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const InfoPage(),
          ));
        }
      },
      child: Container(
        padding: EdgeInsets.all(width * 0.02),
        margin: EdgeInsets.only(bottom: height * 0.05),
        decoration: const BoxDecoration(
          color: Color(0xFF2b478a),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: width * 0.08,
        ),
      ),
    );
  }
}
