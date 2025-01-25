import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../models/send_message_model.dart';
import '../../../screens/chat/chat_screen.dart';
import '../../../services/end_points.dart';
import '../../../services/memory.dart';

class SendMessageController extends GetxController{
  final int? recId;
  SendMessageController(this.recId);
  List<Message> messages=[];
  TextEditingController contentController=TextEditingController();
  bool isLoading=true;
  Future<void>SendMessage()async {
    isLoading = true;
    update();
    String?id = await Get.find<CacheHelper>().getDataString(key: "id");
    print(recId);
    if(contentController.text!="")
    {try {
      final response = await Dio().post(
          "${EndPoint.baseUrl}/api/chat/send",
          data: {
            "senderId": id,
            "content": contentController.text,
            "receiverId": recId
      }
      );
      if (response.statusCode == 200) {
        SendMessageModel r = SendMessageModel.fromJson(response.data);
      } }catch (e) {}
    finally {
      isLoading = false;
      update();
    }}
  }
  void sendMessage(String text) {
    if (text.trim().isNotEmpty) {
      messages.insert(
        0,
        Message(text: text, isSentByMe: true),
      );
      update();
    }
  }
  }
