import 'package:learning_flutter_tools/model/message.dart';

class Chat {
  int id;
  int idOwner;
  int idReceiver;
  List<Message> messages;

  Chat(this.id, this.idOwner, this.idReceiver) : messages = [];

  void addMessage(Message message) {
    messages.add(message);
  }

  @override
  String toString() {
    return "Chat id:$id | Owner id:$idOwner | Receiver id: $idReceiver | Size of Messages: ${messages.length}";
  }
}
