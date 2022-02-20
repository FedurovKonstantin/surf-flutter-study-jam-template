import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:surf_practice_chat_flutter/pages/views/message_input.dart';
import 'package:surf_practice_chat_flutter/pages/views/name_app_bar.dart';

import 'views/messages.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const NameAppBar(),
      body: Column(
        children: const [
          Expanded(
            child: Messages(),
          ),
          MessageInput(),
        ],
      ),
    );
  }
}
