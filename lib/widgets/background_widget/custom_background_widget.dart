import 'dart:ui';

import 'package:flutter/material.dart';

class CustomBackgroundWidget extends StatelessWidget {
  const CustomBackgroundWidget({super.key, required this.page});
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10,right: 10),
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/images/main (1).png"))
        ),
        child: BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
            child: Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              child:page ,
    )));
  }
}
