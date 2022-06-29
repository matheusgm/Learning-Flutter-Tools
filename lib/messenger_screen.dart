import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'model/chat.dart';
import 'model/message.dart';
import 'widget/chat_widget.dart';

const secondScreen = "MESSENGER_SCREEN";

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
    developer.log('initState() was called!', name: secondScreen);
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
    developer.log('dispose() was called!', name: secondScreen);
  }

  @override
  void activate() {
    super.activate();
    developer.log('activate() was called!', name: secondScreen);
  }

  @override
  void deactivate() {
    super.deactivate();
    developer.log('deactivate() was called!', name: secondScreen);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    developer.log('didChangeDependencies() was called!', name: secondScreen);
  }

  @override
  void didUpdateWidget(covariant MessengerScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    developer.log('didUpdateWidget() was called!', name: secondScreen);
  }

  @override
  void reassemble() {
    super.reassemble();
    developer.log('reassemble() was called!', name: secondScreen);
  }

  @override
  Widget build(BuildContext context) {
    developer.log('buildr() was called!', name: secondScreen);
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
                    title: "Group 1",
                    trailing1: const Icon(Icons.edit),
                    trailing2: const Icon(Icons.delete),
                  ),
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
              // This container holds all the children that will be aligned
              // on the bottom and should not scroll with the above ListView
              child: Column(
                children: const <Widget>[
                  Divider(
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                    color: Color.fromARGB(255, 208, 208, 208),
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('New Chat'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget myListTile({String? title, Widget? trailing1, Widget? trailing2}) {
    return Container(
      padding: const EdgeInsets.all(10),
      //color: const Color.fromRGBO(0, 255, 0, 0.7),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(6),
            child: IconTheme(
              data: IconThemeData(color: Colors.grey),
              child: Icon(Icons.message),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              //color: const Color.fromRGBO(255, 0, 255, 1),
              child: Text(
                title ?? "",
                style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ),
          ),
          trailing1 != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6),
                  child: IconTheme(
                    data: const IconThemeData(color: Colors.grey),
                    child: trailing1,
                  ),
                )
              : Container(),
          trailing2 != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 6, left: 6),
                  child: IconTheme(
                    data: const IconThemeData(color: Colors.grey),
                    child: trailing2,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
