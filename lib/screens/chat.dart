import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:surf_practice_chat_flutter/data/chat/repository/repository.dart';
import 'package:surf_practice_chat_flutter/domain/chat/providers.dart';
import 'package:surf_practice_chat_flutter/domain/ui/providers.dart';
import 'package:surf_practice_chat_flutter/domain/ui/ui_exception_manager.dart';
import 'package:surf_practice_chat_flutter/screens/views/message_input.dart';
import 'package:surf_practice_chat_flutter/screens/views/name_app_bar.dart';

import '../domain/user/providers.dart';
import 'views/chat_message.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useEffect(
    //   () {
    //     ref.watch(UIExceptionManagerProvider).init(ScaffoldMessenger.of(context));
    //   },
    //   const [],
    // );

    return Scaffold(
      appBar: const NameAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Messages(),
          ),
          const MessageInput(),
        ],
      ),
    );
  }
}

class Messages extends HookConsumerWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(chatStateHolderProvider);
    final userState = ref.watch(userStateHolderProvider);
    final chatManager = ref.watch(chatManagerProvider);

    useEffect(() {
      chatManager.init();
    }, const []);

    return ListView(
      reverse: true,
      children: chatState
          .map(
            (message) => ChatMessage(
              author: message.author.name,
              message: message.message,
              isMy: userState.name == message.author.name,
            ),
          )
          .toList(),
    );
  }
}
