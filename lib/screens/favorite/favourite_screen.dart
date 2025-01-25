import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/screens/product_details_screen/prdouct_details.dart';

import 'package:nectar/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';

import '../../ui/auth/get_product/get_favourite_controller.dart';
import '../widgets/custombottom/custom_button.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: GetFavouriteController(),
    builder: (GetFavouriteController controller) {
      Get.put(GetFavouriteController());
    return  Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: 3,),
      appBar: AppBar(
        leading: null,
        title: Text("Favourite",style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),),
        centerTitle: true,
        toolbarHeight: Get.height*0.08,
      ),
      body: controller.isLoading // إذا كانت البيانات لم تُجلب بعد، أظهر شاشة التحميل
          ? Center(child: CircularProgressIndicator()):Column(
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
                        child: Image(image: NetworkImage(controller.favouriteProduct?[index].imagePath??""),height:55.69 ,width: 55.69,),
                      ),
                      Container(

                        width: 150
                        ,child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(controller.favouriteProduct?[index].nameproduct??"",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 15
                          ),),
                            Text("${controller.favouriteProduct?[index].quantity??""}, Price",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: Color(0xff7C7C7C)
                            ),)
                        ],),
                      ),
                      Row(
                        children: [
                          Text("\$${controller.favouriteProduct?[index].priceproduct??""}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700
                          ),),
                          IconButton(onPressed: (){
                             Get.to(()=>ProductDetails(productId: controller.favouriteProduct?[index].productid));
                          },
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
               itemCount: controller.favouriteProduct?.length??0),
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
