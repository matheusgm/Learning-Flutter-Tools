import 'package:flutter/material.dart';
import 'package:learning_flutter_tools/model/group_chat.dart';
import 'package:learning_flutter_tools/model/personal_chat.dart';
import 'dart:developer' as developer;
import 'model/chat.dart';
import 'model/message.dart';
import 'widget/chat_widget.dart';

const messengerScreen = "MESSENGER_SCREEN";

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  State<MessengerScreen> createState() => _MessengerScreen();
}

class _MessengerScreen extends State<MessengerScreen> {
  GroupChat chat1 = GroupChat.new("Group 1", 1, 1);
  PersonalChat chat2 = PersonalChat.new(2, 2);
  GroupChat chat3 = GroupChat.new("Group 2", 3, 2);

  List<Chat> chatsList = [];
  int indexChatOn = -1;
  int idClient = -1;

  @override
  void initState() {
    super.initState();
    developer.log('initState() was called!', name: messengerScreen);
    idClient = 1;
    chat1.addMember(2);

    chat1.addMessage(Message.withOutDate(1, idClient, chat1.id, "Hello World!"));
    chat1.addMessage(Message.withOutDate(2, idClient, chat1.id, "Como você está?"));
    chat1.addMessage(Message.withOutDate(3, 2, chat1.id, "Hello Matheus!"));
    chat1.addMessage(Message.withOutDate(4, 2, chat1.id, "Hello Matheus!"));
    chat1.addMessage(Message.withOutDate(5, 2, chat1.id, "Hello Matheus!"));
    chat1.addMessage(Message.withOutDate(6, 2, chat1.id, "Hello Matheus!"));
    chat1.addMessage(Message.withOutDate(7, idClient, chat1.id, "Repetiu muito"));
    chat1.addMessage(Message.withOutDate(8, idClient, chat1.id, "kkkkk"));
    chat1.addMessage(Message.withOutDate(9, idClient, chat1.id, "Bugou"));
    chat1.addMessage(Message.withOutDate(10, idClient, chat1.id, "Testando..."));

    chat2.addMessage(Message.withOutDate(1, idClient, chat2.id, "Hello World 2.0!"));
    chat2.addMessage(Message.withOutDate(2, idClient, chat2.id, "Como você está?"));
    chat2.addMessage(Message.withOutDate(3, 3, chat2.id, "Math kkkkk!"));
    chat2.addMessage(Message.withOutDate(4, 3, chat2.id, "sauhsahusa!"));

    chatsList.add(chat1);
    chatsList.add(chat2);
    chatsList.add(chat3);
  }

  @override
  void dispose() {
    super.dispose();
    developer.log('dispose() was called!', name: messengerScreen);
  }

  @override
  void activate() {
    super.activate();
    developer.log('activate() was called!', name: messengerScreen);
  }

  @override
  void deactivate() {
    super.deactivate();
    developer.log('deactivate() was called!', name: messengerScreen);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    developer.log('didChangeDependencies() was called!', name: messengerScreen);
  }

  @override
  void didUpdateWidget(covariant MessengerScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    developer.log('didUpdateWidget() was called!', name: messengerScreen);
  }

  @override
  void reassemble() {
    super.reassemble();
    developer.log('reassemble() was called!', name: messengerScreen);
  }

  @override
  Widget build(BuildContext context) {
    developer.log('buildr() was called! | indexChats: $indexChatOn', name: messengerScreen);
    developer.log("size: ${chatsList.length}", name: messengerScreen);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messenger'),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Center(
        child: indexChatOn == -1 ? const Text("SEM CHAT") : ChatWidget(chatsList[indexChatOn]),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              child: ListTile(
                title: Text('Messages'),
              ),
              decoration: BoxDecoration(color: Colors.blueGrey),
            ),
            Expanded(
              child: ListView.builder(
                  // controller: listViewScrollController,
                  padding: EdgeInsets.zero,
                  itemCount: chatsList.length,
                  itemBuilder: (context, index) {
                    Chat obj = chatsList[index];
                    return obj is PersonalChat
                        ? personListTile(index: index, personName: "Person ${obj.idReceveir}")
                        : obj is GroupChat
                            ? groupListTile(index: index, groupName: obj.title)
                            : Container();
                  }),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                children: <Widget>[
                  const Divider(
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    color: Color.fromARGB(255, 208, 208, 208),
                  ),
                  myListTile(
                      leading: const Icon(Icons.add),
                      title: 'New Chat',
                      onTapTile: () {
                        developer.log("Create a new chat!", name: messengerScreen);
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget groupListTile({int? index, String? groupName}) {
    GroupChat gc = chatsList[index!] as GroupChat;
    return myListTile(
      leading: const Icon(Icons.group),
      title: groupName,
      trailing1: idClient == gc.idAdmin ? const Icon(Icons.edit) : null,
      trailing2: const Icon(Icons.delete),
      onTap1: () {
        developer.log("Editing groupe <${gc.title}>", name: messengerScreen);
      },
      onTap2: () {
        developer.log("Deleting groupe <${gc.title}>", name: messengerScreen);
      },
      onTapTile: () {
        setState(() {
          indexChatOn = index;
        });
        Navigator.pop(context);
      },
    );
  }

  Widget personListTile({int? index, String? personName}) {
    PersonalChat pc = chatsList[index!] as PersonalChat;
    return myListTile(
      leading: const Icon(Icons.person),
      title: personName,
      trailing2: const Icon(Icons.delete),
      onTap2: () {
        developer.log("Editing person <${pc.idReceveir}>", name: messengerScreen);
      },
      onTapTile: () {
        setState(() {
          indexChatOn = index;
        });
        Navigator.pop(context);
      },
    );
  }

  Widget myListTile(
      {Widget? leading,
      String? title,
      Widget? trailing1,
      Widget? trailing2,
      void Function()? onTapTile,
      void Function()? onTap1,
      void Function()? onTap2}) {
    return Container(
      padding: const EdgeInsets.all(10),
      //color: Colors.blueAccent,
      child: Row(
        children: [
          leading != null
              ? Padding(
                  padding: const EdgeInsets.all(6),
                  child: IconTheme(
                    data: const IconThemeData(color: Colors.grey),
                    child: leading,
                  ),
                )
              : Container(),
          Expanded(
            child: GestureDetector(
              onTap: onTapTile,
              child: Container(
                // color: Colors.amber,
                margin: const EdgeInsets.only(left: 25, right: 5),
                child: Text(
                  title ?? "",
                  style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
            ),
          ),
          trailing1 != null && trailing1 != Container()
              ? IconButton(
                  padding: const EdgeInsets.all(6),
                  icon: trailing1,
                  splashRadius: 20,
                  constraints: const BoxConstraints(),
                  onPressed: onTap1,
                  color: Colors.grey,
                )
              : Container(),
          trailing2 != null
              ? IconButton(
                  padding: const EdgeInsets.all(6),
                  constraints: const BoxConstraints(),
                  icon: trailing2,
                  splashRadius: 20,
                  onPressed: onTap2,
                  color: Colors.grey,
                )
              : Container(),
        ],
      ),
    );
  }
}
