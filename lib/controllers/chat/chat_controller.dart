import 'package:chatty_matty/models/chat_model.dart';
import 'package:chatty_matty/models/message.dart';
import 'package:chatty_matty/utils/app_imports.dart';

class ChatController extends GetxController {
  var messages = <Message>[].obs;
  final textController = TextEditingController();
  RxBool isSending = true.obs;

  String uniqueGroupID = '';

  void sendMessage(String text, String chattingUserId) async {
    if (text.trim().isEmpty) return;

    messages.add(Message(text: text, isMe: true, timestamp: DateTime.now()));
    await sendUserMessage(chattingUserId);
    textController.clear();

    //Simulate reply after 1 second
    // Future.delayed(const Duration(seconds: 1), () {
    //   messages.add(
    //     Message(
    //       text: "Reply to: $text",
    //       isMe: false,
    //       timestamp: DateTime.now(),
    //     ),
    //   );
    //   isSending.value = false;
    // });
  }

  String getChatId(String user1, String user2) {
    print(
      '......... User 1: ${user1.hashCode}.......... User2: ${user2.hashCode}',
    );
    return user1.hashCode <= user2.hashCode
        ? "${user1}_$user2"
        : "${user2}_$user1";
  }

  Future<void> sendUserMessage(String chattingUserId) async {
    try {
      String myId = FirebaseServices.firebaseAuth.currentUser!.uid;
      final chatId = getChatId(myId, chattingUserId);
      ChatModel chatModel = ChatModel(
        userId: myId,
        chatMsg: textController.text.trim(),
        msgTime: DateTime.now(),
        isRead: false,
      );
      await FirebaseServices.fireStoreDB
          .collection(AppConstants.kChatsCollection)
          .doc(chatId)
          .collection(AppConstants.kMessagesCollection)
          .add(chatModel.toJson())
          .then((val) {
            isSending.value = false;
          });
    } catch (e) {
      debugPrint('.......... This is error: $e');
    }
  }
}
