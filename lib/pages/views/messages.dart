import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surf_practice_chat_flutter/pages/page_domain/chat_page_state.dart';
import 'package:surf_practice_chat_flutter/pages/page_domain/providers.dart';
import 'package:surf_practice_chat_flutter/utils/strings.dart';

import '../../domain/chat/providers.dart';
import '../../domain/user/providers.dart';
import 'chat_message.dart';

class Messages extends HookConsumerWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatPageState = ref.watch(chatPageStateHolderProvier);
    final userState = ref.watch(userStateHolderProvider);
    final chatManager = ref.watch(chatManagerProvider);

    // ignore: body_might_complete_normally_nullable
    useEffect(() {
      chatManager.init();
    }, const []);

    if (chatPageState is ChatPageStateFailured) {
      return const Center(
        child: Text(
          Strings.serverException,
        ),
      );
    }
    if (chatPageState is ChatPageStateInProgress) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (chatPageState is ChatPageStateWithData) {
      return ListView(
        reverse: true,
        children: chatPageState.messages
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

    // Чтобы удовлетворить анализатор
    return Container();
  }
}
