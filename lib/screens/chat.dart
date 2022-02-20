import 'package:flutter/material.dart';

import 'package:surf_practice_chat_flutter/data/chat/repository/repository.dart';
import 'package:surf_practice_chat_flutter/screens/views/message_input.dart';
import 'package:surf_practice_chat_flutter/screens/views/name_app_bar.dart';
import 'package:surf_practice_chat_flutter/utils/Strings.dart';

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
            child: Container(),
          ),
          const MessageInput(),
        ],
      ),
    );
  }
}
