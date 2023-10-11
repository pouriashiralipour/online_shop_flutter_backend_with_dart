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
                height: height * 0.5,
                constraints: BoxConstraints(minHeight: height * 0.1),
                margin: EdgeInsets.only(
                    top: height * 0.03,
                    right: width * 0.05,
                    left: width * 0.05),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(height * 0.005),
                      width: width * 0.15,
                      height: height * 0.15,
                      color: index.isEven ? Colors.red : Colors.yellow,
                    );
                  },
                  itemCount: 7,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
