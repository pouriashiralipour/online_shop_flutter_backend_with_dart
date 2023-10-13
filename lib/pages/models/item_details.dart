import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List imageUrl = [
    "https://dkstatics-public.digikala.com/digikala-products/611a2de0cb0ed9da3b609a886a66cc5d95293f14_1696486570.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/format,webp/quality,q_90",
    "https://dkstatics-public.digikala.com/digikala-products/e4cc1a2e3d2f350cd721b5f95a91e4fecf388923_1676891136.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90",
    "data:image/jpeg;base64,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",
  ];
  int active = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF2b478a),
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.03),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.bookmark_add_outlined,
                    size: width * 0.1,
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: width,
                  height: height * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width * 0.08),
                        topRight: Radius.circular(width * 0.08),
                      ),
                      color: Colors.white),
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: width * 0.08,
                            right: width * 0.08,
                            top: height * 0.12),
                        child: Text(
                          "Ullamco ullamco incididunt minim. Commodo sit eu sint veniam ullamco proident minim sunt. Deserunt esse exercitation sit nulla ad commodo labore nisi ut duis exercitation irure. Adipisicing eu ullamco dolore eiusmod exercitation aliquip duis fugiat. Dolor culpa laborum proident nostrud aliqua nisi labore adipisicing voluptate.",
                          style: TextStyle(
                              fontSize: width * 0.04, fontFamily: 'BYekan'),
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'ادامه >',
                          style: TextStyle(
                              fontFamily: "BYekan", fontSize: width * 0.04),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: width,
                  height: height * 0.12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width * 0.08),
                        topRight: Radius.circular(width * 0.08),
                      ),
                      color: const Color(0xFF7c9998)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '80000',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: "BYekan",
                          fontSize: width * 0.04,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: Text(
                          'اضافه کردن به سبد خرید',
                          style: TextStyle(
                              color: const Color(0xFF7c9998),
                              fontFamily: 'BYekan',
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.04),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: width * 0.8,
                  height: height * 0.13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.06),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 15)
                      ]),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        opacity: active == index ? 1 : 0.3,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              active = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: width * 0.03,
                                vertical: height * 0.01),
                            width: width * 0.25,
                            height: height * 0.1,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(imageUrl[index]))),
                          ),
                        ),
                      );
                    },
                    itemCount: imageUrl.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
