class Message {
  int id;
  int idOwner;
  int idChat;
  String text;
  DateTime dateTime;

  Message(this.id, this.idOwner, this.idChat, this.text, this.dateTime);

  @override
  String toString() {
    return "Message id: $id | Chat id: $idChat | Owner id:$idOwner | Text Message:$text | Date Time: $dateTime";
  }
}
