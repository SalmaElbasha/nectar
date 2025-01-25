import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nectar/screens/home_Screen/home_screen.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

import '../../services/memory.dart';
import '../welcomescreen/welcome_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return SplashView(

        backgroundColor: const Color(0xFF53B175),
        duration: const Duration(seconds: 4),
        done: Done(
            Get.find<CacheHelper>().checkUserIsSignedIn?const HomeScreen():const WelcomeScreen()),

        logo: const Stack(
            alignment: Alignment.topCenter,
            children:[
              Image(image: AssetImage('assets/images/Group 1.png')),

            ]
        ) );
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    // AnimatedSplashScreen(
    //   splash:  SingleChildScrollView(
    //     child: Center(
    //       child: Column(
    //         children: [
    //           Container(
    //             child: Text("Home Finder" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 40 ,color: Colors.white),),
    //           ),
    //           SizedBox(
    //             width: 500,
    //               height: 100,
    //               child: Image(image: AssetImage('lib/assets/images/Minimalist Modern Real Estate Agent Logo (3) 1.png')))
    //         ],
    //       ),
    //     ),
    //   ),
    //   nextScreen: Welcomescreen(),
    //   duration: 6000,
    //   backgroundColor: Color(0xff6C63FF),
    //   splashTransition: SplashTransition.fadeTransition,
    //
    // );

  }
}
