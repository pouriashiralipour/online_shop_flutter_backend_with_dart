import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  String productName;
  String productCategory;
  String productPrice;
  DetailsScreen(
      {super.key,
      required this.productName,
      required this.productCategory,
      required this.productPrice});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List imageUrl = [
    "https://pngimg.com/d/tshirt_PNG5454.png",
    "https://pngimg.com/uploads/tshirt/tshirt_PNG5450.png",
    "https://pngimg.com/uploads/tshirt/tshirt_PNG5453.png",
    "https://pngimg.com/uploads/tshirt/tshirt_PNG5451.png",
    "https://pngimg.com/uploads/tshirt/tshirt_PNG5446.png",
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
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: height * 0.06),
                  width: width,
                  height: height * 0.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(imageUrl[active]),
                  )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.03),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.bookmark_outline,
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
                          top: height * 0.1,
                          left: width * 0.08,
                          right: width * 0.08,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.productCategory,
                                style: TextStyle(
                                    color: const Color(0xFF2b478a),
                                    fontFamily: "BYekan",
                                    fontSize: width * 0.04)),
                            Text(
                              widget.productName,
                              style: TextStyle(
                                fontFamily: "BYekan",
                                fontSize: width * 0.04,
                                color: const Color(0xFF2b478a),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: width * 0.08,
                            right: width * 0.08,
                            top: height * 0.02),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.",
                            style: TextStyle(
                                fontSize: width * 0.04, fontFamily: 'BYekan'),
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
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
                        widget.productPrice,
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
