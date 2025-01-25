import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BackButton extends StatelessWidget {
  BackButton({
    super.key,

  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios_new),
      onPressed: () {
        Get.back();
      },
    );
  }
}
