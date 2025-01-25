import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nectar/models/product_model.dart';
import 'package:nectar/models/sign_in_model.dart';

import '../../../models/chat_list_model.dart';
import '../../../models/user_cart_model.dart';
import '../../../services/end_points.dart';
import '../../../services/memory.dart';

class ChatListController extends GetxController{
  List<ChatList>?chats;
  int?recId;
  bool isLoading=true;
  @override
  void onInit()async {
    super.onInit();
    await CacheHelper.init();
    await getChatList();
  }
  Future<void> getChatList()async {
    isLoading = true;
    update();
    String?id = await Get.find<CacheHelper>().getDataString(key: "id");
    try {
      final response = await Dio().get(
          "${EndPoint.baseUrl}/api/chat/${id}"
      );
      if (response.statusCode == 200) {
        ChatListModel r = ChatListModel.fromJson(response.data);
        if (r.message == "success") {
          chats=r.data;
          isLoading = false;
        } else {}
      }
    } catch (e) {

    }
    finally {
      isLoading = false;
      update();
    }
  }}