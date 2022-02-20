import 'package:flutter/material.dart';

import 'package:surf_practice_chat_flutter/data/chat/repository/repository.dart';
import 'package:surf_practice_chat_flutter/screens/ui/views/chat_message.dart';
import 'package:surf_practice_chat_flutter/utils/Strings.dart';

import 'views/message_input.dart';
import 'views/name_app_bar.dart';

class ChatScreen extends StatefulWidget {
  final ChatRepository chatRepository;

  const ChatScreen({
    Key? key,
    required this.chatRepository,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NameAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              reverse: true,
              children: [
                ChatMessage(
                  author: "Artur",
                  message: "Hi dear",
                  isMy: true,
                ),
                ChatMessage(
                  author: "Artur",
                  message: "Hi dear",
                  isMy: false,
                ),
              ],
            ),
          ),
          const MessageInput(),
        ],
      ),
    );
  }
}
