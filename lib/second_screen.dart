import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'model/chat.dart';
import 'model/message.dart';
import 'widget/chat_widget.dart';

const secondScreen = "SECOND_SCREEN";

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
  void didUpdateWidget(covariant SecondScreen oldWidget) {
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
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ChatWidget(chat1),
      ),
    );
  }
}
