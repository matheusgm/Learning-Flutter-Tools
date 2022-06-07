import 'package:learning_flutter_tools/model/message.dart';

class Chat {
  int id;
  int idOwner;
  int idReceiver;
  List<Message> messages;

  Chat(this.id, this.idOwner, this.idReceiver) : messages = [];
}
