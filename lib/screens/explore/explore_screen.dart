import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/beverages_screen/beverages_screen.dart';
import 'package:nectar/screens/categories/bakeries_and_snacks_screen.dart';
import 'package:nectar/screens/categories/beverages_screen.dart';
import 'package:nectar/screens/categories/fruits_and_vegetables_screen.dart';
import 'package:nectar/screens/categories/meat_and_fish_screen.dart';
import 'package:nectar/screens/categories/oils_ghee_screen.dart';
import 'package:nectar/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';

import '../categories/dairy_and_eggs_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height*0.1,
        leading: null,
        centerTitle: true,
        title: Text("Find Products",style: TextStyle(
          color: Color(0xff181725),
          fontWeight: FontWeight.w800,
          fontSize: 22
        ),),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: 1,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: TextFormField(

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF2F3F2),
                  hintText: "Search Store",
                  hintStyle: TextStyle(
                    color: Color(0xff7C7C7C),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                    prefixIcon:Icon(Icons.search_rounded,color: Color(0xff181B19),size: 25,),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color(0xffF4F4F4),
                          width: 3,
                        )
                    )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: Get.width*0.9,
              height: Get.height*0.72,
              child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 15,mainAxisSpacing: 10),
              children: [
                InkWell(
                  onTap:(){
                    Get.to(()=>FruitsAndVegetablesScreen());
                  },
                  child: Container(
                    width: Get.width*0.4,
                    height: Get.height*0.14,
                    decoration: BoxDecoration(
                      color: Color(0xff53B175).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color:Color(0xff53B175) )
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Image(image: AssetImage("assets/images/fruits.png")),
                          ),
                          Container(
                            width: Get.width*0.24,
                            child: Text("Frash Fruits & Vegetable",
                            style: TextStyle(
                              color: Color(0xff181725),
                              fontWeight: FontWeight.w900,fontSize: 16
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>OilsGheeScreen());
                  },
                  child: Container(
                    width: Get.width*0.4,
                    height: Get.height*0.14,
                    decoration: BoxDecoration(
                        color: Color(0xffF8A44C).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color:Color(0xffF8A44C) )
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0,right: 10),
                            child: Image(image: AssetImage("assets/images/oil.png")),
                          ),
                          Center(
                            child: Container(
                              width: Get.width*0.25,
                              child: Center(
                                child: Text("Cooking Oil ",
                                  style: TextStyle(
                                      color: Color(0xff181725),
                                      fontWeight: FontWeight.w900,fontSize: 16
                                  ),),
                              ),
                            ),
                          ),
                          Center(child: Text("& Ghee",
                            style: TextStyle(
                      color: Color(0xff181725),
                      fontWeight: FontWeight.w900,fontSize: 16
        
                            ),
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>MeatAndFishScreen());
                  }
                  ,child: Container(
                    width: Get.width*0.4,
                    height: Get.height*0.10,
                    decoration: BoxDecoration(
                        color: Color(0xffF7A593).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color:Color(0xffF7A593) )
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Image(image: AssetImage("assets/images/meat.png")),
                          ),
                          Container(
                            width: Get.width*0.24,
                            height: Get.height*0.05,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Meat & Fish",
                                  style: TextStyle(
                                      color: Color(0xff181725),
                                      fontWeight: FontWeight.w900,fontSize: 16
                                  ),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>BakeriesAndSnacksScreen());
                  },
                  child: Container(
                    width: Get.width*0.4,
                    height: Get.height*0.14,
                    decoration: BoxDecoration(
                        color: Color(0xffD3B0E0).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color:Color(0xffD3B0E0) )
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Image(image: AssetImage("assets/images/bakery.png")),
                          ),
                          Container(
                            width: Get.width*0.35,
                            height: Get.height*0.05,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Bakery & Snacks",
                                  style: TextStyle(
                                      color: Color(0xff181725),
                                      fontWeight: FontWeight.w900,fontSize: 16
                                  ),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>DairyAndEggsScreen());
                  },
                  child: Container(
                    width: Get.width*0.4,
                    height: Get.height*0.14,
                    decoration: BoxDecoration(
                        color: Color(0xffFDE598).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color:Color(0xffFDE598) )
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Image(image: AssetImage("assets/images/dairy.png")),
                          ),
                          Container(
                            width: Get.width*0.31,
                            height: Get.height*0.05,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Dairy & Eggs",
                                  style: TextStyle(
                                      color: Color(0xff181725),
                                      fontWeight: FontWeight.w900,fontSize: 16
                                  ),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                   onTap: (){Get.to(()=>BeveragesScreen());},
                  child: Container(
                    width: Get.width*0.4,
                    height: Get.height*0.14,
                    decoration: BoxDecoration(
                        color: Color(0xffB7DFF5).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color:Color(0xffB7DFF5) )
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Image(image: AssetImage("assets/images/Beverages.png")),
                          ),
                          Container(
                            width: Get.width*0.31,
                            height: Get.height*0.05,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Beverages",
                                  style: TextStyle(
                                      color: Color(0xff181725),
                                      fontWeight: FontWeight.w900,fontSize: 16
                                  ),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],),
            )
          ],
        ),
      ),
    );
  }
}
