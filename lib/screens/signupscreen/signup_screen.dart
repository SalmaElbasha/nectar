import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nectar/screens/enteryourmobile/enter_your_mobile.dart';

import '../../ui/auth/sign_up/sign_up_controller.dart';
import '../../widgets/background_widget/custom_background_widget.dart';
import '../logingscreen/loging_screen.dart';
import '../widgets/custombottom/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: SignUpController(),
    builder: (SignUpController controller) {
    return Scaffold(
      body: CustomBackgroundWidget(
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
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "Enter your credentials to continue",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff7C7C7C),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
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
                            controller: controller.userNameController,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "By continuing you agree to our ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              TextSpan(
                                text: "Terms of Service",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                },
                              ),
                              TextSpan(
                                text: " and ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              TextSpan(
                                text: "Privacy Policy.",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )

                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: CustomButton(onPressed: () {
                      controller.signUp(context);
                    }, text: 'Sign up',)),
                    Text(
                      "Already have an account?  ",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    TextButton(
                      onPressed: (){
                        Get.to(()=>LogingScreen());
                      },
                      child: Text(
                        "Log in ",
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
