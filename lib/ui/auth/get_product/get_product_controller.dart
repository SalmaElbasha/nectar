import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nectar/models/product_model.dart';
import 'package:nectar/models/sign_in_model.dart';
import 'package:nectar/models/user_cart_model.dart';
import 'package:nectar/ui/auth/get_user_data/get_user_data_controller.dart';

import '../../../services/end_points.dart';
import '../../../services/memory.dart';

class GetProductController extends GetxController{
  GetUserDataController c=GetUserDataController();
  static String? userPhoto;
  bool isLoading=true;
  List<Datum>? product;
  List<Datum>? productVegetable;
  List<Datum>? productMeat;
  List<CartItem>? cartItem;
  dynamic cartId;
  String category="Fruit";
TextEditingController search=TextEditingController();
  @override
  void onInit()async {
    super.onInit();
    isLoading=true;
    await  getProductsByVegetable();
    await getProductsByMeat();
    await getProductsByCategory();
    await c.getUserProfile();
    userPhoto=c.user?.photoPath??"";
    update();
 isLoading=false;

  }
  Future<void> getProductsByCategory()async{
    try {
      final response = await Dio().get(
          "${EndPoint.baseUrl}/Products/category/$category"
      );
      if(response.statusCode==200){
        ProductModel r = ProductModel.fromJson(response.data);
        if(r.message=="success"){
         product=r.data;
        }else{
        }
      }
    }catch(e){
    }

  }
  Future<void> getProductsByVegetable()async{

    try {
      final response = await Dio().get(
          "${EndPoint.baseUrl}/Products/category/Vegetable"
      );
      if(response.statusCode==200){
        ProductModel r = ProductModel.fromJson(response.data);
        if(r.message=="success"){
          productVegetable=r.data;
        }else{
        }
      }
    }catch(e){
    }
  }
  Future<void> getProductsByMeat()async{
    try {
      final response = await Dio().get(
          "${EndPoint.baseUrl}/Products/category/Meat"
      );
      if(response.statusCode==200){
        ProductModel r = ProductModel.fromJson(response.data);
        if(r.message=="success"){
          productMeat=r.data;
        }else{
        }
      }
    }catch(e){
    }

  }
  Future<bool?>getUserCart()async{
    isLoading=true;
    String?id=await Get.find<CacheHelper>().getDataString(key: "id");
    try {
      final response = await Dio().get(
          "${EndPoint.baseUrl}/ShoppingCart/CartByUserId/$id"
      );
      if(response.statusCode==200){
        UserCartModel r = UserCartModel.fromJson(response.data);
        if(r.message=="success"){
          cartItem=r.data?.cartItems??[];
          cartId=r.data?.id;
          isLoading=false;
            return true;
        }else{
          return false;
        }
      }
    }catch(e){
    }
    finally{
      isLoading=false;
      update();
    }
  }
  Future<void>addCartItem(int? itemId)async{
    isLoading=true;

    try {
      final response = await Dio().post(
          "${EndPoint.baseUrl}/ShoppingCart/AddItem/$itemId",
          data: {
            "id":cartId
          }
      );
      if(response.statusCode==200){
        UserCartModel r = UserCartModel.fromJson(response.data);
        if(r.message=="success"){
          cartItem=r.data?.cartItems??[];
          cartId=r.data?.id;
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
  Future<void>postUserCart(int? itemId)async{
    await getUserCart();
    isLoading=true;

    String?id=await Get.find<CacheHelper>().getDataString(key: "id");
if(cartId==null){
  print("cartId=null66666666666666666666666666666666666666666");
  try {
    final response = await Dio().post(
      "${EndPoint.baseUrl}/ShoppingCart/CreateCart/$id",
      data: {

      }

    );
    if(response.statusCode==200){
      UserCartModel r = UserCartModel.fromJson(response.data);
      if(r.message=="success"){
        cartItem=r.data?.cartItems??[];
        cartId=r.data?.id;
        print("created666666666666666666666666666666");
        isLoading=false;
      }else{
      }
    }
  }catch(e){}
  finally{
    isLoading=false;
    update();
  }

addCartItem(itemId);
}else{
  print("cartId!=null66666666666666666666666666666666666666666");
 await addCartItem(itemId);

}
  }




}