import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../models/favourite_model.dart';
import '../../../models/get_one_product-model.dart';
import '../../../models/sign_in_model.dart';
import '../../../screens/product_details_screen/prdouct_details.dart';
import '../../../services/end_points.dart';
import '../../../services/memory.dart';

class GetFavouriteController extends GetxController{
  List<Datum>? favouriteProduct=[];
  OneData? product;
  bool isLoading=true;

  @override
  void onInit()async {
    super.onInit();

    await CacheHelper.init();
    await GetFavourite();
    Timer.periodic(Duration(seconds:1), (timer) async {
      await GetFavourite();
    });
  }
  int quantity = 1;
  double get unitPrice {
    if (product != null && product!.priceproduct != null) {
      // Check if the priceproduct is a string
      if (product!.priceproduct is String) {
        final priceString = product!.priceproduct as String;
        // Try to parse the string as a double
        final parsedPrice = double.tryParse(priceString);
        if (parsedPrice != null) {
          return parsedPrice;
        }
      }

    }
    return 1.0; // Fallback value
  }

  // Calculate totalPrice as a double
  double get totalPrice => unitPrice * quantity;
  void increaseQuantity() {
      quantity++;
        update();
  }

  void decreaseQuantity() {
      if (quantity > 1) {
        quantity--;
        update();
      }

  }
  Future<void> GetFavourite() async {
    print("hhhhhhhhhhhhhhhhhhhhhh");
    isLoading = true;
    String? id = await Get.find<CacheHelper>().getDataString(key: "id");

    try {
      final response = await Dio().get(
          "${EndPoint.baseUrl}/nectar/getFavoriteProduct/$id");

      if (response.statusCode == 200) {
        GetfavouriteModel r = GetfavouriteModel.fromJson(response.data);
        if (r.message == "success") {
          print("sssssssssssssssssssssssssssssssssssssssssssss");

          // إذا كانت البيانات الجديدة مختلفة، نقوم بتحديث العناصر دون تغيير ترتيبها
          if (favouriteProduct != r.data) {
            // احتفظ بالعناصر القديمة وأضف العناصر الجديدة أو حدثها حسب الحاجة
            for (var newProduct in r.data!) {
              var index = favouriteProduct?.indexWhere((product) => product.productid == newProduct.productid);
              if (index != -1) {
                // إذا كان المنتج موجودًا مسبقًا في القائمة، قم بتحديثه
                favouriteProduct?[index!] = newProduct;
              } else {
                // إذا لم يكن موجودًا، أضفه في النهاية
                favouriteProduct?.add(newProduct);
              }
            }
            update();  // تحديث واجهة المستخدم
          }

          isLoading = false;
        }
      }
    } catch (e) {
      print("Error fetching favorites: $e");
    } finally {
      isLoading = false;
      update();  // تحديث واجهة المستخدم بعد العملية
    }
  }

  void removeProductFromFavourites(int productId) {
    // إزالة المنتج من القائمة باستخدام الـ id الخاص به
    favouriteProduct?.removeWhere((product) => product.productid == productId);
    update();
    Get.forceAppUpdate(); // تحديث واجهة المستخدم
  }


  Future<void> GetProductDetails(int? productId)async{
    isLoading=true;
    try {
      final response = await Dio().get(
          "${EndPoint.baseUrl}/Products/$productId"
      );
      if(response.statusCode==200){
        GetOneProductModel r = GetOneProductModel.fromJson(response.data);
        if(r.message=="success"){
          product=r.data;
          isLoading=false;

        }else{
        }
      }
    }catch(e){}
    finally{
      isLoading=false;
      update();

    }
  }

}