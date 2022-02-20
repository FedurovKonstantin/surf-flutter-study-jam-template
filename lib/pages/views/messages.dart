import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/chat/providers.dart';
import '../../domain/user/providers.dart';
import 'chat_message.dart';

class Messages extends HookConsumerWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(chatStateHolderProvider);
    final userState = ref.watch(userStateHolderProvider);
    final chatManager = ref.watch(chatManagerProvider);

    // ignore: body_might_complete_normally_nullable
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
