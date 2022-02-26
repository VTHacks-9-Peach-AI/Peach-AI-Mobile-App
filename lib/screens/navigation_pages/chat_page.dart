import 'package:flutter/material.dart';
import 'package:peachai/models/Chat.dart';
import 'package:peachai/widgets/chat_card.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) =>
                ChatCard(chat: chatsData[index], press: () {}),
          ),
        ),
      ],
    ));
  }
}
