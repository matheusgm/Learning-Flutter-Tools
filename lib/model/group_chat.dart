import 'package:learning_flutter_tools/model/chat.dart';

class GroupChat extends Chat {
  String title;
  int idAdmin;
  List<int> members;

  GroupChat.new(this.title, idChat, this.idAdmin)
      : members = [idAdmin],
        super(idChat);

  void addMember(int idNewMember) {
    members.add(idNewMember);
  }

  @override
  String toString() {
    return "Group Chat id: $id | Title: $title | Size of Members: ${members.length} | Size of Messages: ${messages.length}";
  }
}
