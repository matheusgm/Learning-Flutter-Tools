import 'package:flutter/material.dart';
import 'package:learning_flutter_tools/model/chat.dart';
import 'package:learning_flutter_tools/model/message.dart';
import 'package:learning_flutter_tools/widget/message_widget.dart';
import 'dart:developer' as developer;

const messengerDebug = "MESSENGER";

class ChatWidget extends StatefulWidget {
  final Chat chat;
  const ChatWidget(this.chat, {Key? key}) : super(key: key);

  @override
  State<ChatWidget> createState() => _ChatWidget();
}

class _ChatWidget extends State<ChatWidget> {
  int idClient = -1;
  List<Message> listOfMessages = [];
  final myMessageController = TextEditingController();
  final ScrollController listViewScrollController = ScrollController();

  @override
  void initState() {
    idClient = widget.chat.idOwner;
    listOfMessages = widget.chat.messages;

    super.initState();
  }

  @override
  void dispose() {
    myMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        chatListView(),
        chatInput(),
      ],
    );
  }

  Widget chatListView() {
    int lomSize = listOfMessages.length - 1;
    return Expanded(
      child: ListView.builder(
        controller: listViewScrollController,
        itemCount: listOfMessages.length,
        reverse: true,
        itemBuilder: (context, index) {
          //developer.log(listOfMessages[lomSize - index].toString(), name: messengerDebug);
          return listOfMessages[lomSize - index].idOwner == idClient
              ? MessageWidget(listOfMessages[lomSize - index].text, listOfMessages[lomSize - index].dateTime)
              : MessageWidget(listOfMessages[lomSize - index].text, listOfMessages[lomSize - index].dateTime,
                  alignmentRight: false);
        },
      ),
    );
  }

  Widget chatInput() {
    return SizedBox(
      height: 60,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.amber,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: TextField(
                      controller: myMessageController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "Message",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.arrow_forward),
                    color: Colors.black,
                    iconSize: 40.0,
                    onPressed: () {
                      developer.log("Messenger Button Click!", name: messengerDebug);
                      if (myMessageController.text.isNotEmpty) {
                        developer.log("Message: <${myMessageController.text}>");
                        setState(() {
                          listOfMessages.add(
                              Message.withOutDate(listOfMessages.length + 1, idClient, 1, myMessageController.text));
                        });

                        myMessageController.clear();
                      } else {
                        developer.log("Message is empty!");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
