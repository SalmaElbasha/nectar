import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../logingscreen/loging_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child:Container(
          width: Get.width,
          height: Get.height,
          color: Color(0xffffffff),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width,
                height: Get.height*0.42,
                decoration: const BoxDecoration(
                  image: DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/images/signInPhoto.png"))

                ),
              ),
              Container(
                width: Get.width*0.8,
                height: Get.height*0.11,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: Get.width*0.6,
                      child: Text("Get your groceries with nectar",style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff030303)
                      ),),
                    ),
                  ],
                ),

              ),
              Container(
                height: Get.height*0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(

                      width: Get.width*0.85,
                      child: IntlPhoneField(
                        showDropdownIcon: false,
                          disableLengthCheck: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 12),
                            hintText: "    Enter your mobile number",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xff303030),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey), // Customize the color as needed
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue), // Customize the color as needed
                            ),
                          ),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                    ),

                  ],

                ),
              ),
              Center(
                child: Text("Or connect with social media",
                  style: TextStyle(
                      color: Color(0xff828282),
                      fontWeight: FontWeight.w700,
                      fontSize: 14
                  ),),
              ),
              Container(
                height: Get.height*0.15,
                child: Center(
                  child: ElevatedButton(onPressed: (){}, child:
                  Row(children: [
                    Image(image: AssetImage("assets/images/googleIcon.png"),width: 35,height: 40,)
                  ,Container(
                      width: Get.width*0.6,
                    child: Center(child: Text("Continue with Google",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xffFCFCFC)
                      ),)),
                  )],),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5383EC),
                    fixedSize: Size(Get.width*0.9, Get.height*0.08),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19)
                    )
                  ),),
                ),
              ),
              Container(
                height: Get.height*0.1,
                child: Center(
                  child: ElevatedButton(onPressed: (){}, child:
                  Row(children: [
                    Image(image: AssetImage("assets/images/facebookIcon.png"),width: 35,height: 40,)
                    ,Container(
                      width: Get.width*0.6,
                      child: Center(child: Text("Continue with Facebook",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color(0xffFCFCFC)
                        ),)),
                    )],),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff4A66AC),
                        fixedSize: Size(Get.width*0.9, Get.height*0.08),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19)
                        )
                    ),),
                ),

              ),Container(
                  height: Get.height*0.1,
                  child: Center(
                    child: ElevatedButton(onPressed: (){}, child:
                    Row(children: [
                      Image(image: AssetImage("assets/images/facebookIcon.png"),width: 35,height: 40,)
                      ,Container(
                        width: Get.width*0.6,
                        child: Center(child: Text("Continue with Facebook",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color(0xffFCFCFC)
                          ),)),
                      )],),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff4A66AC),
                          fixedSize: Size(Get.width*0.9, Get.height*0.08),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19)
                          )
                      ),),
                  ),
                ),
                Container(
                  height: Get.height*0.1,
                  child: Center(
                    child: ElevatedButton(onPressed: (){
                      Get.to(()=>LogingScreen());
                    }, child:
                    Row(children: [
                      Image(image: AssetImage("assets/images/email-png-high-resolution-web-icons-png-27.png"),width: 45,height: 45,)
                      ,Container(
                        width: Get.width*0.6,
                        child: Center(child: Text("Continue with Email",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color(0xffFCFCFC)
                          ),)),
                      )],),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff808080),
                          fixedSize: Size(Get.width*0.9, Get.height*0.08),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19)
                          )
                      ),),
                  ),
                )
              ],
            ),


        ),
      ),
    );
  }
}
