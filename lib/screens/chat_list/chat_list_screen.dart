import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:nectar/screens/chat/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectar/ui/auth/get_user_data/get_user_data_controller.dart';

import '../../ui/auth/get_product/get_product_controller.dart';
import 'controller/chat_list_controller.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatListController>(
        init: ChatListController(),
    builder: (controller) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height*0.07,
       shape: Border(bottom: BorderSide(color: Colors.grey,width: 0.8),),
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0,bottom: 5),
          child: CircleAvatar(radius: 50,backgroundImage: NetworkImage(GetProductController.userPhoto??""),),
        ),
        title: Padding(
         padding:  const EdgeInsets.only(bottom: 5),
          child: Text("Chats",style:
           TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.bold,
             color: Colors.black
           ) ,),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 5,bottom: 5),
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  color: Colors.grey,
                  blurRadius: 7
                )
              ]
            ),
            child: Center(
              child: Icon(Icons.edit_outlined,color: Color(0xff005FFF),),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: "Search ",
                    hintStyle: TextStyle(
                      color: Color(0xff7C7C7C),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon:Icon(Icons.search_rounded,color: Color(0xff181B19),size: 30,),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:  BorderSide(
                          color: Colors.black12,
                          width: 2,
                        )
                    )
                ),
              ),
            ),
            Container(
              width: Get.width,
              height: Get.height*0.81,
              child:controller.isLoading
                  ? Center(child: CircularProgressIndicator()): ListView.separated(
                padding:EdgeInsets.only(top: 8.0,bottom: 8),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                  Get.to(()=>ChatScreen( recId: controller.chats?[index].otherUserId,));
                  print( controller.chats?[index].otherUserId);
                  },
                  child: SizedBox(
                    width: Get.width,
                    height: 70,
                    child: Row(
                      children: [
                         Padding(
                          padding: EdgeInsets.only(left: 5.0,right: 3.5),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(controller.chats?[index].otherUserPhoto??""),
                            radius: 28,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: Get.width*0.81
                              ,child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text(controller.chats?[index].otherUser??"",style:
                                    TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:18,


                                    ),),
                                  Container(width: 25,height: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: Center(
                                    child: Text("1",style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                        color: Colors.white),),
                                  ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.width*0.805,
                              height: 20,
                              child: Center(
                                child: Row(
                                 crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text(controller.chats?[index].lastMessage??"",style:
                                    TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize:13,
                                      color: Colors.grey,

                                    ),),

                                    Text(  controller.chats?[index].timestamp != null
                                        ? DateFormat('HH:mm').format(controller.chats![index].timestamp as DateTime)
                                        : "",style: TextStyle(
                                      color: Color(0xff7a7a7a),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700
                                    ),)
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              } , separatorBuilder: (context, index)
              {return Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                child: Container(width: Get.width,height: 2,color: Colors.black12,),
              );}, itemCount: controller.chats?.length??0),
            )
          ],
        ),
      ),
    );});
  }
}
