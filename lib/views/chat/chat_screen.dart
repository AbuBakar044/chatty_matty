import 'package:chatty_matty/controllers/chat/chat_controller.dart';
import 'package:chatty_matty/controllers/home_controller/friends_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final ChatController chatCtrl = Get.put(ChatController());
  final friendCtrl = Get.find<FriendsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat"), backgroundColor: Colors.teal),
      body: SafeArea(
        child: Column(
          children: [
            // Messages List
            Expanded(
              child: Obx(
                () => ListView.builder(
                  reverse: true, // newest at bottom
                  padding: const EdgeInsets.all(10),
                  itemCount: chatCtrl.messages.length,
                  itemBuilder: (context, index) {
                    final message =
                        chatCtrl.messages[chatCtrl.messages.length -
                            1 -
                            index]; // reverse order
                    return Align(
                      alignment: message.isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: message.isMe
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: message.isMe
                                  ? Colors.teal.shade400
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              message.text,
                              style: TextStyle(
                                color: message.isMe ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                          // const SizedBox(width: 1),
                          message.isMe && chatCtrl.isSending.value
                              ? SizedBox(
                                  height: 10,
                                  width: 10,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1,
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
        
            // Input Field
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.grey.shade200,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: chatCtrl.textController,
                      decoration: const InputDecoration(
                        hintText: "Type a message...",
                        border: InputBorder.none,
                      ),
                      onSubmitted: (val) {
                        chatCtrl.sendMessage(
                          val,
                          friendCtrl.selectedUser.value.userId ?? '',
                        );
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.teal),
                    onPressed: () => chatCtrl.sendMessage(
                      chatCtrl.textController.text,
                      friendCtrl.selectedUser.value.userId ?? '',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
