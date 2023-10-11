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

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin<MainScreen> {
  late TabController myController;
  int tabIndex = 0;
  @override
  void initState() {
    super.initState();
    myController = TabController(length: 3, vsync: this);
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
                constraints: BoxConstraints(minHeight: height * 0.1),
                margin: EdgeInsets.only(
                    top: height * 0.03,
                    right: width * 0.05,
                    left: width * 0.05),
                child: TabBar(
                  onTap: (value) {
                    setState(() {
                      tabIndex = myController.index;
                    });
                  },
                  indicatorColor: Colors.white,
                  controller: myController,
                  tabs: const [
                    Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.podcasts,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.calculate,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.5,
                // color: Colors.red,
                child: TabBarView(
                  controller: myController,
                  children: [
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.green,
                    ),
                    Container(color: Colors.yellow),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
