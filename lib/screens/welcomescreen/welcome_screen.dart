import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';

import '../sign_in_screen/sign_in_screen.dart';
import '../widgets/custombottom/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/8140 1.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Container(
                child: Image.asset('assets/images/Group.png'),
              ),
              SizedBox(height: 10,),
              Text(
                "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 2,),
              Text(
                "to our store",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Ger your groceries in as fast as one hour",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40,),
              Container(
                  child: CustomButton(onPressed: (){Get.to(()=>SignInScreen());}, text: 'Get Started',)),

            ],
          ),
        ),
      ),
    );
  }
}
