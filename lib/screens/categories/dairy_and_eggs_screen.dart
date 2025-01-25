import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nectar/screens/filter/filter_screen.dart';

import '../../ui/auth/get_product/get_dairy_and_eggs_controller.dart';
import '../../ui/auth/get_product/get_fruits_controller.dart';
import '../../widgets/Beverages_widget/Beverages_widget.dart';
import '../product_details_screen/prdouct_details.dart';


class DairyAndEggsScreen extends StatelessWidget {
  const DairyAndEggsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: GetDairyAndEggsController(),
        builder: (GetDairyAndEggsController controller) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 60,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_outlined), onPressed: () {Get.back();},),
              title: Text(
                'Dairy & Eggs',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800,
                  fontSize: 20,),),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Image.asset('assets/images/Group 6839.png'),
                  onPressed: () {
                    Get.to(() => FilterScreen());
                  },
                ),
              ],
            ),
            body: controller
                .isLoading // إذا كانت البيانات لم تُجلب بعد، أظهر شاشة التحميل
                ? Center(child: CircularProgressIndicator()) : Container(
              margin: EdgeInsets.only(left: 10,top: 15,bottom: 15),
              width: Get.width * 0.95,
              height: Get.height - 60,
              child: GridView.builder(
                itemCount: controller.product?.length??0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30.0,
                  mainAxisSpacing: 30.0,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      Get.to(()=>ProductDetails(productId:controller.product?[index].productid??0, ));
                    },
                    child: BeveragesWidget(index: index, title:controller.product?[index].nameproduct??"", price: controller.product?[index].priceproduct??"", kilo: "${controller.product?[index].quantity}", onTap: () {controller.postUserCart(controller.product?[index].productid); }, image: controller.product?[index].imagePath??"",)),
                scrollDirection: Axis.vertical,

              ),
            ),

          );
        });
  }
}
