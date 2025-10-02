class ChatModel {
  String? userId;
  String? chatMsg;
  DateTime? msgTime;
  bool? isRead;

  ChatModel({this.userId, this.chatMsg, this.msgTime, this.isRead});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      userId: json['user_id']?.toString(),
      chatMsg: json['chat_msg'],
      msgTime: json['msg_time'],
      isRead: json['is_read'] is bool
          ? json['is_read']
          : json['is_read'] == "1" || json['is_read'] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "chat_msg": chatMsg,
      "msg_time": msgTime,
      "is_read": isRead,
    };
  }
}
