import 'package:learning_flutter_tools/model/message.dart';

class Chat {
  int id;
  List<Message> messages;

  Chat(this.id) : messages = [];

  void addMessage(Message message) {
    messages.add(message);
  }

  @override
  String toString() {
    return "Chat id: $id | Size of Messages: ${messages.length}";
  }
}
