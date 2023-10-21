class ChatMessage {
  final MessageType type;
  final String sender;
  final String? content;

  ChatMessage(
      {required this.type, required this.sender, required this.content});

  ChatMessage.joinMessage(String username)
      : type = MessageType.join,
        sender = username,
        content = null;

  Map<String, dynamic> toJson() => {
        'type': type.name,
        'content': content,
        'sender': sender,
      };

  ChatMessage.fromJson(Map<String, dynamic> json)
      : type = json['type'].toString().toEnum(),
        sender = json['sender'],
        content = json['content'];
}

enum MessageType { chat, join, leave }

extension MessageTypeExt on MessageType {
  String get name {
    switch (this) {
      case MessageType.chat:
        return "CHAT";
      case MessageType.join:
        return "JOIN";
      case MessageType.leave:
        return "LEAVE";
    }
  }
}

extension EnumEx on String {
  MessageType toEnum() {
    switch (this) {
      case "JOIN":
        return MessageType.join;
      case "LEAVE":
        return MessageType.leave;
      case "CHAT":
      default:
        return MessageType.chat;
    }
  }
}
