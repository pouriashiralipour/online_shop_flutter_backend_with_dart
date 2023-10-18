import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: width,
            height: height * 0.6,
            child: Column(
              children: [
                customTextField(
                    height,
                    width,
                    nameController,
                    "نام کاربری یا ایمیل",
                    false,
                    Icons.person,
                    TextInputAction.done,
                    TextInputType.emailAddress),
                customTextField(
                    height,
                    width,
                    passwordController,
                    "رمز عبور",
                    true,
                    Icons.lock,
                    TextInputAction.done,
                    TextInputType.visiblePassword),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    constraints: BoxConstraints(minHeight: height * 0.06),
                    padding: EdgeInsets.only(top: height * 0.01),
                    margin: EdgeInsets.only(top: height * 0.08),
                    height: height * 0.06,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(width * 0.1)),
                    child: Text(
                      "ورود",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "BYekan",
                          color: Colors.white,
                          fontSize: width * 0.05),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextField(
      double height,
      double width,
      TextEditingController textEditingController,
      String lable,
      bool obscure,
      IconData icon,
      TextInputAction action,
      TextInputType textInputType) {
    return Container(
      margin: EdgeInsets.only(
          left: width * 0.15, right: width * 0.15, top: height * 0.08),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          obscureText: obscure,
          controller: textEditingController,
          textDirection: TextDirection.rtl,
          keyboardType: textInputType,
          textInputAction: action,
          decoration: InputDecoration(
            suffixIcon: Icon(
              icon,
              color: const Color(0xFF2b478a),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 2, color: Color(0xFF2b478a)),
                borderRadius: BorderRadius.circular(width * 0.05)),
            labelText: lable,
            labelStyle: TextStyle(
                fontFamily: "BYekan",
                fontSize: width * 0.035,
                color: const Color(0xFF2b478a)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 2, color: Color(0xFF2b478a)),
                borderRadius: BorderRadius.circular(width * 0.05)),
          ),
        ),
      ),
    );
  }
}
