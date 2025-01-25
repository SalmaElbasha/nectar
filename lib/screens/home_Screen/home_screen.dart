import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/categories/grains_screen.dart';
import 'package:nectar/screens/categories/groceries_screen.dart';
import 'package:nectar/screens/categories/snacks_screen.dart';
import 'package:nectar/screens/categories/vegetable_screen.dart';
import 'package:nectar/screens/product_details_screen/prdouct_details.dart';
import 'package:nectar/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import '../../ui/auth/get_product/get_product_controller.dart';
import '../../widgets/Groceries_widget/groceries_widget.dart';
import '../../widgets/best_selling_widget/best_selling_widget.dart';
import '../../widgets/food_container_widget/food_container_widget.dart';
import '../categories/fruits_screen.dart';
import '../categories/search_screen.dart';
import '../chat_list/chat_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: GetProductController(),
        builder: (GetProductController controller) {
          return Scaffold(
            bottomNavigationBar: CustomBottomNavigationBar(
              selectedIndex: 0,
            ),
            body: Container(
              width: Get.width * 0.97,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20), // Added spacing
                    Center(
                      child: Container(
                        height: 55.64,
                        width: 47.84,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/carrotorange.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Added spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, size: 24),
                        SizedBox(width: 8), // Added spacing
                        InkWell(
                          onTap: (){Get.to(()=>ChatListScreen());},
                          child: Text(
                            "Dhaka, Banassre",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff4C4F4D),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // Added spacing
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        width: Get.width * 0.9,
                        child: TextFormField(
                          controller: controller.search,
                          onFieldSubmitted:(s) {Get.to(()=>SearchScreen(search:controller.search.text ,));},
                          decoration: InputDecoration(
                            hintText: 'Search Store',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: InkWell(
                              onTap: (){
                                Get.to(()=>SearchScreen(search:controller.search.text ,));
                              },
                                child: Icon(Icons.search, color: Colors.black)),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Added spacing
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        width: Get.width * 0.94,
                        height: 114.99,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/banner.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Added spacing
                    Container(
                      width: Get.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " Fresh Fruits",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff181725),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: InkWell(
                              onTap: (){
                                Get.to(()=>FruitsScreen());
                              },
                              child: Text(
                                "See all",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff53B175),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20), // Added spacing
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: Get.width * 0.95,
                      height: 248.51,
                      child: controller.isLoading
                          ? Center(child: CircularProgressIndicator()):Center(
                        child: ListView.separated(
                          itemBuilder: (context, index) =>
                              InkWell(
                                onTap: (){
                                  Get.to(()=>ProductDetails(productId:controller.product?[index].productid??0, ));
                                },
                                child: FoodContainerWidget(index: index, title:controller.product?[index].nameproduct??"", price: controller.product?[index].priceproduct??"", kilo:"${controller.product?[index].quantity??""}", onTap: (){
                                  controller.postUserCart(controller.product?[index].productid);
                                }, image: controller.product?[index].imagePath??"",),
                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 30.0),
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Added spacing
                    Container(
                      width: Get.width * 0.9,
                      child: Row(
                        children: [
                          Text(
                            "  Vegetables",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff181725),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: InkWell(
                              onTap: (){
                                Get.to(()=>VegetableScreen());
                              },
                              child: Text(
                                "See all",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff53B175),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20), // Added spacing
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: Get.width * 0.95,
                      height: 248.51,
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            InkWell(
                                onTap: (){
                                  Get.to(()=>ProductDetails(productId:controller.productVegetable?[index].productid??0, ));
                                },
                                child: BestSellingWidget(index: index, title: controller.productVegetable?[index].nameproduct??"", price:controller.productVegetable?[index].priceproduct??"", kilo:"${controller.productVegetable?[index].quantity??""}", onTap: () { controller.postUserCart(controller.productVegetable?[index].productid); },  image: controller.productVegetable?[index].imagePath??"",)),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 30.0),
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    SizedBox(height: 20), // Added spacing
                    Container(
                      width: Get.width * 0.9,
                      child: Row(
                        children: [
                          Text(
                            "Groceries",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff181725),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: InkWell(
                              onTap: (){
                                Get.to(()=>GroceriesScreen());
                              },
                              child: Text(
                                "See all",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff53B175),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20), // Added spacing
                    Container(
                      height: 105,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            onTap: (){
                              Get.to(()=>GrainsScreen());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 248.19,
                              height: 105,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Color(0xffF8A44C).withOpacity(0.2),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  ClipRRect(
                                    child: Image.asset(
                                      'assets/images/pulses.png',
                                      width: 71.9,
                                      height: 71.9,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Grains",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff181725),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: (){
                              Get.to(()=>SnacksScreen());
                            },
                            child: Container(
                              width: 248.19,
                              height: 105,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Color(0xff53B175).withOpacity(0.2),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  ClipRRect(
                                    child: Image.asset(
                                      'assets/images/Beverages.png',
                                      width: 71.9,
                                      height: 71.9,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Snacks",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff181725),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20), // Added spacing
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: Get.width * 0.95,
                      height: 248.51,
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            InkWell(
                                onTap: (){
                                  Get.to(()=>ProductDetails(productId:controller.productMeat?[index].productid??0, ));
                                },
                                child: GroceriesWidget(index: index, title:controller.productMeat?[index].nameproduct??"", price:controller.productMeat?[index].priceproduct??"", kilo: "${controller.productMeat?[index].quantity??""}", onTap: () { controller.postUserCart(controller.productMeat?[index].productid); }, image: controller.productMeat?[index].imagePath??"",)),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 30.0),
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    SizedBox(height: 20), // Added spacing
                  ],
                ),
              ),
            ),
          );
        });
  }
}
