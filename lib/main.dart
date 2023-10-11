import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Shop',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 6, 106, 213)),
        useMaterial3: true,
      ),
      home: const MainScreen(title: 'Online Shop HomePage'),
    );
  }
}

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
                          'MyOnlineShop',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.07,
                              fontWeight: FontWeight.bold),
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
                            borderRadius: BorderRadius.circular(height * 0.03)),
                        child: Center(
                          child: Text(
                            index == 0 ? 'همه' : "دسته$index",
                            style: TextStyle(
                                color: activeTab == index
                                    ? Colors.black
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
                      topLeft: Radius.circular(width * 0.1),
                      topRight: Radius.circular(width * 0.1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
