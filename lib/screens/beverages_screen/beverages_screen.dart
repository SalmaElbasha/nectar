// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:nectar/screens/filter/filter_screen.dart';
//
// import '../../widgets/Beverages_widget/Beverages_widget.dart';
// import '../../widgets/food_container_widget/food_container_widget.dart';
//
// class BeveragesScreen extends StatelessWidget {
//   const BeveragesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 60,
//         leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_outlined), onPressed: () {  },),
//         title:  Text(
//           'Beverages',style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800,
//           fontSize: 20,),),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Image.asset('assets/images/Group 6839.png'),
//             onPressed: () {
//               Get.to(()=>FilterScreen());
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         margin: EdgeInsets.only(left: 10),
//         width: Get.width * 0.95,
//         height: Get.height-60,
//         child: GridView.builder(
//           itemCount: 6,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 30.0,
//             mainAxisSpacing: 30.0,
//             childAspectRatio: 0.75,
//           ),
//           itemBuilder: (context, index) => BeveragesWidget(index: index),
//           scrollDirection: Axis.vertical,
//
//         ),
//       ),
//
//     );
//   }
// }
