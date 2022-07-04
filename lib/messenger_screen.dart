import 'package:flutter/material.dart';
import 'package:learning_flutter_tools/model/group_chat.dart';
import 'package:learning_flutter_tools/model/personal_chat.dart';
import 'package:learning_flutter_tools/widget/group_list_tile.dart';
import 'package:learning_flutter_tools/widget/modal_widget.dart';
import 'package:learning_flutter_tools/widget/my_drawer_widget.dart';
import 'package:learning_flutter_tools/widget/my_list_tile_widget.dart';
import 'package:learning_flutter_tools/widget/my_radio.dart';
import 'package:learning_flutter_tools/widget/personal_list_tile.dart';
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

  int? radioValue = -1;

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
    developer.log('buildr() was called! ', name: messengerScreen);
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
        child: indexChatOn == -1 ? const Text("SEM CHAT") : ChatWidget(idClient, chatsList[indexChatOn]),
      ),
      endDrawer: MyDrawer(
        headerTitle: const ListTile(
          title: Text('Messages'),
        ),
        body: drawerBody(),
        footerBody: [
          drawerFooterBody(),
        ],
      ),
    );
  }

  Widget drawerBody() {
    return ListView.builder(
      // controller: listViewScrollController,
      padding: EdgeInsets.zero,
      itemCount: chatsList.length,
      itemBuilder: (context, index) {
        Chat obj = chatsList[index];
        return obj is PersonalChat
            ? personalListTile(obj, index)
            : obj is GroupChat
                ? groupListTile(obj, index)
                : Container();
      },
    );
  }

  Widget drawerFooterBody() {
    return GestureDetector(
      onTap: () {
        developer.log("Creating a new group", name: messengerScreen);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (context, setState) => Modal(
                headerTitle: "New Chat",
                body: createNewChatModalBody(setState),
                modalButtons: ModalButtons.cancelAndCreate,
                footerButtonTap: [
                  () {
                    developer.log("Cancel Button of New Chat", name: messengerScreen);
                    Navigator.pop(context);
                  },
                  () {
                    developer.log("Create Button of New Chat", name: messengerScreen);
                  },
                ],
              ),
            );
          },
        );
      },
      child: const MyListTile(
        leading: Icon(Icons.add),
        title: 'New Chat',
      ),
    );
  }

  Widget createNewChatModalBody(StateSetter setState) {
    return StatefulBuilder(
      builder: (context, setState) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyRadio(
                name: "Personal",
                value: 1,
                groupValue: radioValue,
                radioChange: (dynamic value) {
                  setState(() {
                    radioValue = value;
                  });
                },
              ),
              MyRadio(
                name: "Group",
                value: 2,
                groupValue: radioValue,
                radioChange: (dynamic value) {
                  setState(() {
                    radioValue = value;
                  });
                },
              ),
            ],
          ),
          radioValue == 1
              ? const Text("Personal Body")
              : radioValue == 2
                  ? const Text("Group Body")
                  : const Text("Hello body"),
        ],
      ),
    );
  }

  Widget personalListTile(PersonalChat pc, int index) {
    return PersonalListTile(
      title: "Person ${pc.idReceveir}",
      tileTap: () {
        setState(() {
          indexChatOn = index;
        });
        Navigator.pop(context);
      },
      onDelete: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Modal(
              headerTitle: "Delete",
              body: Text("Are you sure you want to delete ${pc.idReceveir}?"),
              modalButtons: ModalButtons.noAndYes,
              footerButtonTap: [
                () {
                  Navigator.pop(context);
                },
                () {
                  developer.log("Deleting person <Person ${pc.idReceveir}>", name: messengerScreen);
                }
              ],
            );
          },
        );
      },
    );
  }

  Widget groupListTile(GroupChat gc, int index) {
    return GroupListTile(
      title: gc.title,
      clientIsAdmin: idClient == gc.idAdmin,
      tileTap: () {
        setState(() {
          indexChatOn = index;
        });
        Navigator.pop(context);
      },
      onDelete: () {
        developer.log("Deleting groupe <${gc.title}>", name: messengerScreen);
      },
      onEdit: () {
        developer.log("Editing groupe <${gc.title}>", name: messengerScreen);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Modal(
              headerTitle: gc.title,
              modalButtons: ModalButtons.cancelAndAccept,
            );
          },
        );
      },
    );
  }
}
