import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nectar/models/update_quantity_model.dart';
import 'package:nectar/models/user_cart_model.dart';
import 'package:nectar/screens/mycarts_screen/my_carts_screen.dart';
import '../../../models/sign_in_model.dart';
import '../../../services/end_points.dart';
import '../../../services/memory.dart';

class GetMyCartController extends GetxController {
  List<CartItem>? cartItem;
  bool isLoading = true;
  int? cartId;
  Map<String, int>? productQuantities;
   List<int> quantities=[] ;
  @override
  void onInit() async {
    super.onInit();
    await CacheHelper.init();
    await getMyCart();
  }


  final List<double> totalPrices = [];
 List<double>unitPrice=[];



  void increaseQuantity(int index) {
    quantities?[index]++;
    totalPrices[index] = unitPrice[index] * quantities[index];
    updateQuantity(cartItem?[index].productid,quantities?[index]);
    update();

  }

  void decreaseQuantity(int index) {
    if (quantities[index] > 1) {
      quantities[index]--;
      totalPrices[index] = unitPrice[index] * quantities[index];
      updateQuantity(cartItem?[index].productid,quantities[index]);
      print(quantities[index]);
      update();
    }
  }

  Future<void> getMyCart() async {
    isLoading = true;
    cartItem = [];
    totalPrices.clear();
    unitPrice.clear();
    quantities = [];
    update();
    String? id = await Get.find<CacheHelper>().getDataString(key: "id");

    try {
      final response = await Dio().get(
        "${EndPoint.baseUrl}/ShoppingCart/CartByUserId/$id",
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
          cartItem = r.data?.cartItems;
          cartId=r.data?.id;
          productQuantities=r.data?.productQuantities;

           quantities=productQuantities?.values.toList()??[];
          print(quantities);

          for(int i=0; i < quantities.length; i++){
            unitPrice.add(double.parse(cartItem?[i].priceproduct??""));
            totalPrices.add(unitPrice[i]);
          }
          
        } else {
          print("Failed to retrieve cart items.");
        }
      } else {
        print("Error: Status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching cart: $e");
    } finally {
      isLoading = false;
      update();
      print(cartItem);
    }
  }

  Future<void> updateQuantity(int? productId ,int? quantity) async {
    isLoading = true;
    update();
    try {
      final response = await Dio().patch(
        "${EndPoint.baseUrl}/ShoppingCart/UpdateQuantity",
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },

        ),
        data: {
          "cartId": cartId,
          "productId":productId,
          "quantity":quantity
        }
      );

      if (response.statusCode == 200) {
        UpdateQuantityModel r = UpdateQuantityModel.fromJson(response.data);
        if (r.message == "success") {
            update();
          }
        } else {
          print("Failed to retrieve cart items.");
        }
    } catch (e) {
      print("Error fetching cart: $e");
    } finally {
      isLoading = false;
      update();
    }
  }
  Future<void> DeleteProductInMyCart(int? productId) async {
    isLoading = true;
    update();


    try {
      final response = await Dio().delete(
        "${EndPoint.baseUrl}/ShoppingCart/DeletePreoduct/$cartId/$productId",
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
          await getMyCart();
          isLoading = false;

          update();
        }
      }
    } catch (e) {
      print("Error fetching cart: $e");
    } finally {
      await getMyCart();
      isLoading = false;
      update();


    }
  }
}
