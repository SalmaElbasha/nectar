import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/models/error_model.dart';
import 'package:nectar/models/sign_in_model.dart';
import 'package:nectar/screens/home_Screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/end_points.dart';
import '../../../services/memory.dart';

class SignUpController extends GetxController{
  var response;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController userNameController=TextEditingController();
  Future<void> signUp(BuildContext context) async {
    print("Attempting signUp...");

    try {
      final response = await Dio().post(
        "${EndPoint.baseUrl}/nectar/signUp",
        data: {
          "email": emailController.text,
          "password": passwordController.text,
          "username":userNameController.text
        },
      );

      print(response.data);

      // Ensure successful response status
      if (response.statusCode == 200) {
        // Convert response data to ResponseModel
        SignInModel r = SignInModel.fromJson(response.data);

        // Display a success dialog
        if(r.message=="success"){
           late SharedPreferences sharedPreferences;
          sharedPreferences = await SharedPreferences.getInstance();

           await Get.find<CacheHelper>().saveData(key:"id", value: r.data?.id);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(" ${r.message}"),
                content: Text("Logged in successfully"),
                actions: [
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Get.back(); // Close the dialog
                    },
                  ),
                ],
              );
            },
          );
          Get.to(HomeScreen());
        }else{
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(" ${r.message}"),
                content: Text("${r.data}"),
                actions: [
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Get.back(); // Close the dialog
                    },
                  ),
                ],
              );
            },
          );

        }
      }
    } catch (e) {
      print("Error: $e");

      // Show an error dialog
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text("Error"),
      //       content: Text("An error occurred: $e"),
      //       actions: [
      //         TextButton(
      //           child: Text("OK"),
      //           onPressed: () {
      //             Get.back(); // Close the dialog
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
    }
  }
}