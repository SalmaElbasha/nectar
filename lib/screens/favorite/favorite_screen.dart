import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/favorite/controller/favorite_screen_controller.dart';
import 'package:nectar/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';

import '../widgets/custombottom/custom_button.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: FavoriteScreenController(),
    builder: (FavoriteScreenController controller) {
    return  Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: 3,),
      appBar: AppBar(
        leading: null,
        title: Text("Favorurite",style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),),
        centerTitle: true,
        toolbarHeight: Get.height*0.08,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: Get.width*0.95,
              height: 1,
              color: Colors.grey,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10,left: 15),
          height: Get.height*0.71,
            child: ListView.builder(itemBuilder: (context,index){
              return Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 10,bottom: 10),
                        child: Image(image: AssetImage(controller.drinksPhotos[index]),height:55.69 ,width: 55.69,),
                      ),
                      Container(

                        width: 150
                        ,child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(controller.drinksNames[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 15
                          ),),
                            Text("${controller.drinksVolume[index]}, Price",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: Color(0xff7C7C7C)
                            ),)
                        ],),
                      ),
                      Row(
                        children: [
                          Text("\$${controller.drinksPrices[index]}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700
                          ),),
                          IconButton(onPressed: (){},
                              icon: Icon(Icons.chevron_right))
                        ],
                      ),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: Container(
                      width: Get.width*0.95,
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              );
            },
               itemCount: 5),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Center(
              child: CustomButton(
                onPressed: () {},
                text: 'Add All To Cart',
              ),
            ),
          ),
        ],
      ),
    );});
  }
}
