import 'package:chatty_matty/models/chat_model.dart';
import 'package:chatty_matty/models/message.dart';
import 'package:chatty_matty/utils/app_imports.dart';

class ChatController extends GetxController {
  var messages = <Message>[].obs;
  final textController = TextEditingController();
  RxBool isSending = true.obs;
  Map<String, bool> chatExists = {};

  String uniqueGroupID = '';

  void sendMessage(String text, String chattingUserId) async {
    if (text.trim().isEmpty) return;

    messages.add(Message(text: text, isMe: true, timestamp: DateTime.now()));
    await sendUserMessage(chattingUserId);
    textController.clear();
  }

  String getChatId(String user1, String user2) {
    print(
      '......... User 1: ${user1.hashCode}.......... User2: ${user2.hashCode}',
    );
    return user1.hashCode <= user2.hashCode
        ? "${user1}_$user2"
        : "${user2}_$user1";
  }

  // Future<void> sendUserMessage(String chattingUserId) async {
  //   try {
  //     String myId = FirebaseServices.firebaseAuth.currentUser!.uid;
  //     final chatId = getChatId(myId, chattingUserId);
  //     ChatModel chatModel = ChatModel(
  //       userId: myId,
  //       chatMsg: textController.text.trim(),
  //       msgTime: DateTime.now(),
  //       isRead: false,
  //     );

  //     await FirebaseServices.fireStoreDB
  //         .collection(AppConstants.kChatsCollection)
  //         .doc(chatId)
  //         .collection(AppConstants.kMessagesCollection)
  //         .add(chatModel.toJson())
  //         .then((val) {
  //           isSending.value = false;
  //         });
  //   } catch (e) {
  //     debugPrint('.......... This is error: $e');
  //   }
  // }


  Future<void> sendUserMessage(String chattingUserId) async {
    try {
      String myId = FirebaseServices.firebaseAuth.currentUser!.uid;
      final chatId = getChatId(myId, chattingUserId);

      final chatGroupRef = FirebaseServices.fireStoreDB
          .collection(AppConstants.kChatsCollection)
          .doc(chatId);

      // ✅ Step 1: Check if chat already exists (cached check)
      if (!chatExists.containsKey(chatId)) {
        final chatSnap = await chatGroupRef.get();
        chatExists[chatId] = chatSnap.exists;

        if (!chatSnap.exists) {
          // Create the chat document and add members
          await chatGroupRef.set({
            'createdAt': DateTime.now(),
            'lastUpdated': DateTime.now(),
            'lastMessage': '',
          });

          final membersRef = chatGroupRef.collection('members');

          UserModel userModel = UserModel(
            
          );
          await membersRef.doc(myId).set({
            'userId': myId,
            'joinedAt': DateTime.now(),
          });
          await membersRef.doc(chattingUserId).set({
            'userId': chattingUserId,
            'joinedAt': DateTime.now(),
          });
        }
      }

      // ✅ Step 2: Prepare and send the message
      final messageText = textController.text.trim();
      if (messageText.isEmpty) return; // prevent empty messages

      ChatModel chatModel = ChatModel(
        userId: myId,
        chatMsg: messageText,
        msgTime: DateTime.now(),
        isRead: false,
      );

      await chatGroupRef
          .collection(AppConstants.kMessagesCollection)
          .add(chatModel.toJson());

      // ✅ Step 3: Update chat metadata (for chat list previews)
      await chatGroupRef.update({
        'lastUpdated': DateTime.now(),
        'lastMessage': messageText,
        'lastSender': myId,
      });

      // ✅ Step 4: Clear input and mark sending done
      textController.clear();
      isSending.value = false;
    } catch (e) {
      debugPrint('.......... Error sending message: $e');
      isSending.value = false;
    }
  }


  Future<void> getChatMessages() async {
    try {} catch (e) {}
  }
}
