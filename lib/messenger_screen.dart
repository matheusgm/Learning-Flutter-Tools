import 'package:flutter/material.dart';
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
  // idOwner = 1 -> Matheus
  // idOwner = 2 -> Outra Pessoa
  // idChat = 1 -> Chat do Matheus com Outra pessoa
  Chat chat1 = Chat(1, 1, 2);

  @override
  void initState() {
    super.initState();
    developer.log('initState() was called!', name: messengerScreen);
    int idClient = 1;
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
    developer.log('buildr() was called!', name: messengerScreen);
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
        child: ChatWidget(chat1),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const DrawerHeader(
                    child: ListTile(
                      title: Text('Messages'),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Messages'),
                    trailing: Icon(Icons.delete),
                  ),
                  myListTile(
                      leading: const Icon(Icons.person),
                      title: "Group 1",
                      trailing1: const Icon(Icons.edit),
                      trailing2: const Icon(Icons.delete),
                      onTap1: () {
                        developer.log("Edit button clicked!", name: messengerScreen);
                      },
                      onTap2: () {
                        developer.log("Delete button clicked!", name: messengerScreen);
                      }),
                  const ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Profile'),
                    tileColor: Color.fromRGBO(255, 0, 0, 0.7),
                  ),
                ],
              ),
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget myListTile(
      {Widget? leading,
      String? title,
      Widget? trailing1,
      Widget? trailing2,
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
            child: Container(
              // color: Colors.amber,
              margin: const EdgeInsets.only(left: 25, right: 5),
              child: Text(
                title ?? "",
                style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ),
          ),
          trailing1 != null
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
