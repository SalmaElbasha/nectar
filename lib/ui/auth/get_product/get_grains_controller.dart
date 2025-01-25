import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nectar/models/product_model.dart';
import 'package:nectar/models/sign_in_model.dart';

import '../../../models/user_cart_model.dart';
import '../../../services/end_points.dart';
import '../../../services/memory.dart';

class GetGrainsController extends GetxController{
  List<CartItem> cartItem=[];
  dynamic? cartId;
  List<Datum>? product=[];
  String category="Grains";
  bool isLoading=true;
  @override
  void onInit()async {

    super.onInit();
    await getProductsByCategory();
    await getUserCart();
  }
  Future<void> getProductsByCategory()async{
    isLoading=true;
    update();
    try {

      final response = await Dio().get(
          "${EndPoint.baseUrl}/Products/category/$category"
      );
      if(response.statusCode==200){
        ProductModel r = ProductModel.fromJson(response.data);
        if(r.message=="success"){

          product=r.data;
          isLoading=false;
        }else{
        }
      }
    }catch(e){

    }
    finally{
      isLoading=false;
      update();
    }
  }
  Future<bool?>getUserCart()async{
    isLoading=true;
    update();
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
  Future<void>postUserCart(int? itemId)async{
    isLoading=true;
    update();
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
      addCartItem(itemId);
    }
  }
  Future<void>addCartItem(int? itemId)async{
    isLoading=true;
    update();
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

}