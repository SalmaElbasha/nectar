import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../ui/auth/chat/send_Message_controller.dart'; // Import SendMessageController

class ChatScreen extends StatelessWidget {
  final int? recId;
 bool isEmojiVisible = false; // Make emoji visibility reactive
  final ImagePicker _imagePicker = ImagePicker();

   ChatScreen({super.key, required this.recId}); // ImagePicker object

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SendMessageController>(
      init: SendMessageController(recId),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 55.0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 5.0, bottom: 3),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
                radius: 50,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Anil",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Online • Last seen 2 days ago",
                  style: TextStyle(fontSize: 13, color: Colors.grey[300]),
                ),
              ],
            ),
            actions: [
              IconButton(icon: Icon(Icons.phone), onPressed: () {}),
              IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
              IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[index];
                    return Align(
                      alignment: message.isSentByMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75,
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: message.isSentByMe
                              ? Colors.green
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: message.isSentByMe
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.text,
                              style: TextStyle(
                                color: message.isSentByMe
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              message.timestamp,
                              style: TextStyle(
                                color: message.isSentByMe
                                    ? Colors.white70
                                    : Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.contentController,
                        onTap: () {
                          if (isEmojiVisible) {
                            isEmojiVisible = false;
                          }
                        },
                        onSubmitted: (text) async {
                          await controller.SendMessage();
                          controller.sendMessage(text);
                          controller.contentController.clear();
                        },
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                          prefixIcon: IconButton(
                            icon: Icon(
                              isEmojiVisible
                                  ? Icons.keyboard
                                  : Icons.emoji_emotions_outlined,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              isEmojiVisible = !isEmojiVisible;
                              FocusScope.of(context).unfocus();
                            },
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.attach_file, color: Colors.grey),
                                onPressed: () async {
                                  // Open file picker
                                  FilePickerResult? result = await FilePicker.platform.pickFiles();

                                  if (result != null) {
                                    String? fileName = result.files.single.name;
                                    controller.sendMessage("📎 Sent a file: $fileName");
                                  } else {
                                    print("No file selected");
                                  }
                                },
                              ),
                              SizedBox(width: 5),
                              GestureDetector(
                                onTap: () async {
                                  final XFile? image = await _imagePicker.pickImage(
                                    source: ImageSource.camera,
                                  );
                                  if (image != null) {
                                    controller.sendMessage("📷 Sent an image: ${image.name}");
                                  }
                                },
                                child: Icon(Icons.camera_alt, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: Colors.green),
                      onPressed: () async {
                        await controller.SendMessage();
                        controller.sendMessage(controller.contentController.text);
                        controller.contentController.clear();
                      },
                    ),
                  ],
                ),
              ),
              if (isEmojiVisible)
                SizedBox(
                  height: 300,
                  child: EmojiPicker(
                    textEditingController: controller.contentController,
                    config: Config(checkPlatformCompatibility: true),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class Message {
  final String text;
  final bool isSentByMe;
  final String timestamp;

  Message({required this.text, required this.isSentByMe})
      : timestamp = DateTime.now().toString().substring(11, 16);
}
