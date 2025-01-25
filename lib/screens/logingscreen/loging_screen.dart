import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nectar/screens/home_Screen/home_screen.dart';
import 'package:nectar/screens/signupscreen/signup_screen.dart';
import 'package:nectar/widgets/background_widget/custom_background_widget.dart';

import '../../ui/auth/sign_in/sign_in_controller.dart';
import '../widgets/custombottom/custom_button.dart';

class LogingScreen extends StatefulWidget {
  const LogingScreen({super.key});

  @override
  State<LogingScreen> createState() => _LogingScreenState();
}

class _LogingScreenState extends State<LogingScreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: SignInController(),
    builder: (SignInController controller) {
    return Scaffold(
      body:CustomBackgroundWidget(
        page: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Center(
                    child: Container(
                      width: 47,
                      height: 57,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/carrotorange.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Loging",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "Enter your emails and password",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff7C7C7C),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff7C7C7C),
                          ),
                        ),
                        Container(
                          width: Get.width,
                          height: 78,
                          child: TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff53B175), width: 2.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff7C7C7C),
                          ),
                        ),
                        Container(
                          width: Get.width,
                          height: 78,
                          child: TextFormField(
                            controller: controller.passwordController,
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff53B175), width: 2.0),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot        ",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Password?",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: CustomButton(onPressed: () {
                     controller.signIn(context);
                    }, text: 'Log in',)),
                    Text(
                      "Don’t have an account? ",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    TextButton(
                      onPressed: (){
                        Get.to(()=>SignupScreen());
                      },
                      child: Text(
                        "SingUp ",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Color(0xff53B175),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );});
  }
}
