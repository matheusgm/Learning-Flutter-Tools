import 'package:learning_flutter_tools/model/chat.dart';

class PersonalChat extends Chat {
  int idReceveir;

  PersonalChat.new(idChat, this.idReceveir) : super(idChat);

  @override
  String toString() {
    return "Personal Chat id: $id | Receiver id: $idReceveir | Size of Messages: ${messages.length}";
  }
}
