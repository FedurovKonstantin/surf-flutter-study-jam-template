import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surf_practice_chat_flutter/domain/chat/providers.dart';
import 'package:surf_practice_chat_flutter/utils/Strings.dart';

class MessageInput extends HookConsumerWidget {
  const MessageInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatManager = ref.watch(chatManagerProvider);

    final TextEditingController messageController;

    messageController = useTextEditingController();

    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: 10,
      ),
      child: Column(
        children: [
          const Divider(),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    hintText: Strings.messageHint,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => chatManager.sendMessage(messageController.text),
                icon: const Icon(
                  Icons.send,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
