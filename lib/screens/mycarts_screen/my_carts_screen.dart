import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../ui/auth/get_product/get_my_cart_controller.dart';
import '../../widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import '../widgets/custombottom/custom_button.dart';

class MyCartsScreen extends StatelessWidget {
  const MyCartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: GetMyCartController(),
      builder: (GetMyCartController controller) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: 2,),
          appBar: AppBar(
            toolbarHeight: Get.height * 0.08,
            title: Text(
              'My Cart',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Divider(
                color: Color(0xffE2E2E2), // Divider color
                thickness: 1,       // Thickness of the divider
                indent: 10,         // Start margin
                endIndent: 10,      // End margin
              ),
              Container(
                height: Get.height*0.71,
                child: ListView.builder(
                  itemCount: controller.cartItem?.length??0,
                  itemBuilder: (context, index) {
                    return Container(
                      width: Get.width * 0.9,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                 controller.cartItem?[index].imagePath??"",
                                width: 100,
                                height: 88,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${controller.cartItem?[index]?.nameproduct??""}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: () {
                                            controller.DeleteProductInMyCart(controller.cartItem?[index].productid);
                                          },
                                          icon: Icon(Icons.close, color: Color(0xffB3B3B3)),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${controller.cartItem?[index]?.quantity??""}",
                                      style: TextStyle(
                                        color: Color(0xff7C7C7C),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(17),
                                            border: Border.all(color: Colors.grey),
                                          ),
                                          child: IconButton(
                                            onPressed: () => controller.decreaseQuantity(index),

                                            icon: Icon(Icons.remove, color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          '${controller.quantities[index]}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(17),
                                            border: Border.all(color: Colors.grey),
                                          ),
                                          child: IconButton(
                                            onPressed: () => controller.increaseQuantity(index),
                                            icon: Icon(Icons.add, color: Colors.green),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        '\$${controller.totalPrices[index].toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xff181725),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Divider(
                                  color: Color(0xffE2E2E2), // Divider color
                                  thickness: 1,       // Thickness of the divider
                                  indent: 10,         // Start margin
                                  endIndent: 10,      // End margin
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              CustomButton(onPressed: () {  }, text: 'Go to Checkout',),
            ],
          ),
        );
      },
    );
  }
}
