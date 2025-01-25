import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nectar/ui/auth/get_product/get_favourite_controller.dart';

import '../../../models/favourite_model.dart';
import '../../../models/get_one_product-model.dart';

import '../../../models/user_cart_model.dart';
import '../../../services/end_points.dart';
import '../../../services/memory.dart';

class GetProductDetailController extends GetxController{
  OneData? product;
  bool isLoading=true;
  final int? productId;
  List<CartItem>? cartItem;
  dynamic cartId;
  GetProductDetailController(this.productId);
  List<Datum>? favouriteProduct=[];
  bool isProductInFavourites = false;
  @override
  void onInit()async {
    super.onInit();
    bool test4 = Get.isRegistered<GetFavouriteController>();
    if(test4){
      Get.delete<GetFavouriteController>();
    }
    Get.delete<GetFavouriteController>();
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await  GetFavourite();
      await GetProductDetails(productId);
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
  Future<void> PostAndDeleteFavoriteProduct(int? ProductId) async {
    isLoading = true;
    String? id = await Get.find<CacheHelper>().getDataString(key: "id");
    try {
      final response = await Dio().get(
          "${EndPoint.baseUrl}/nectar/getFavoriteProduct/$id"
      );
      if (response.statusCode == 200) {
        GetfavouriteModel r = GetfavouriteModel.fromJson(response.data);
        if (r.message == "success") {
          favouriteProduct = r.data;
          isLoading = false;
          update();

          // Check if the product exists in the favouriteProduct list
          if (favouriteProduct != null && favouriteProduct!.any((product) => product.productid == ProductId)) {

            // المنتج موجود في المفضلة، نقوم بحذفه
            await deleteFavoriteProduct(ProductId);
            bool test4 = Get.isRegistered<GetFavouriteController>();
            if(test4){
              Get.delete<GetFavouriteController>();
            }
          } else {
            // المنتج غير موجود في المفضلة، نقوم بإضافته
            await AddFavoriteProduct(ProductId);
            bool test4 = Get.isRegistered<GetFavouriteController>();
            if(test4){
              Get.delete<GetFavouriteController>();
            }
          }
        } else {
          // Handle failure if needed
          isLoading = false;
        }
      }
    } catch (e) {
      // Handle error
      isLoading = false;
    } finally {
      bool test4 = Get.isRegistered<GetFavouriteController>();
      if(test4){
        Get.delete<GetFavouriteController>();
      }
      isLoading = false;
      update();
    }
  }
  Future<void> GetFavourite() async {
    isLoading = true;
    String? id = await Get.find<CacheHelper>().getDataString(key: "id");

    try {
      final response = await Dio().get(
          "${EndPoint.baseUrl}/nectar/getFavoriteProduct/$id"
      );

      if (response.statusCode == 200) {
        GetfavouriteModel r = GetfavouriteModel.fromJson(response.data);
        if (r.message == "success") {
          favouriteProduct = r.data ?? [];  // تحديث المنتجات المفضلة
          // تحقق مما إذا كان المنتج موجودًا في المفضلة
          isProductInFavourites = favouriteProduct!.any((product) => product.productid == productId);
        }
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading = false;
    }
  }
  Future<void>AddFavoriteProduct(int? ProductId)async{
    isLoading=true;
    String?id=await Get.find<CacheHelper>().getDataString(key: "id");

      try {
        final response = await Dio().post(
            "${EndPoint.baseUrl}/nectar/addFavoriteProduct/$ProductId",
            data: {
              "id":id
            }

        );
        if(response.statusCode==200){
          UserCartModel r = UserCartModel.fromJson(response.data);
          if(r.message=="success"){
            isLoading=false;
          }else{
          }
        }
      }catch(e){}
      finally{

        isLoading=false;
        bool test4 = Get.isRegistered<GetFavouriteController>();
        if(test4){
          Get.delete<GetFavouriteController>();
        }
        isProductInFavourites=true;

        update();
      }

  }
  Future<void> deleteFavoriteProduct(int? productId) async {
    isLoading = true;
    String?id=await Get.find<CacheHelper>().getDataString(key: "id");
    update();
    try {
      final response = await Dio().delete(
        "${EndPoint.baseUrl}/nectar/deleteFavorite/${productId}/${id}",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        UserCartModel r = UserCartModel.fromJson(response.data);
        if (r.message == "success") {
          isLoading = false;
          update();
        }
      }
    } catch (e) {
      print("Error fetching cart: $e");
    } finally {
      isLoading = false;
      update();
      bool test4 = Get.isRegistered<GetFavouriteController>();
      if(test4){
        Get.delete<GetFavouriteController>();
      }
      isProductInFavourites=false;
    }
  }
}