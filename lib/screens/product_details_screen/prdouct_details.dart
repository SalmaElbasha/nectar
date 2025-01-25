import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/ui/auth/get_product/get_product_controller.dart';
import 'package:nectar/ui/auth/get_product/get_product_detail_controller.dart';

import '../../ui/auth/get_product/get_favourite_controller.dart';
import '../widgets/custombottom/custom_button.dart';

class ProductDetails extends StatelessWidget {
final int? productId;
  const ProductDetails({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {


    return GetBuilder(
        init: GetProductDetailController(productId),
    builder: (GetProductDetailController controller) {
        Get.delete<GetFavouriteController>();
    return Scaffold(
      body: controller.isLoading
          ? Center(child: CircularProgressIndicator()):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            height: 371.44,
            decoration: BoxDecoration(
              color: Color(0xffF2F3F2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios_new),
                        onPressed: () {
                          bool test4 = Get.isRegistered<GetFavouriteController>();
                          if(test4){
                            Get.delete<GetFavouriteController>();

                          }
                          Get.put(GetFavouriteController());
                          Get.back();
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.save_alt),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Image.network(
                  controller.product?.imagePath??"",
                  width: Get.width * 0.8,
                  height: 199.18,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            width: Get.width*0.96,
            height: Get.height-400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.product?.nameproduct??"",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff181725),
                          ),
                        ),
                        Text(
                          "${controller.product?.quantity??""}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff7C7C7C),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {

                        controller.PostAndDeleteFavoriteProduct(controller.product?.productid??0);

                      },color: controller.isProductInFavourites?Colors.red:Colors.grey,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: controller.decreaseQuantity,
                          icon: Icon(Icons.remove, color: Colors.green),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                            child: Text(
                              "${controller.quantity}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: controller.increaseQuantity,
                          icon: Icon(Icons.add, color: Colors.green),
                        ),
                      ],
                    ),
                    Text(
                      '\$${controller.totalPrice}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff181725),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: Get.height*0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Container(
                          width: Get.width*0.99,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),

                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Product Detail",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff181725),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.navigate_next_outlined),
                            onPressed: () {

                              Get.back();
                            },
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: Get.width*0.99,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),

                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nutritions",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff181725),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 33.61,
                                height: 27,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Center(
                                  child: Text(
                                    '100gr',
                                    style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.navigate_next_outlined),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: Get.width*0.99,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),

                        ),
                      ),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Review",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff181725),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 150,
                                height: 10,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return
                                     Icon(Icons.star, color: Color(0xffF3603F),size: 28,);


                                  },
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.navigate_next_outlined),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: CustomButton(
                    onPressed: () {
                      controller.postUserCart(controller.product?.productid??0);
                    },
                    text: 'Add To Cart',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );});
  }
}
