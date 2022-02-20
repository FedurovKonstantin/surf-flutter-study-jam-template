import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surf_practice_chat_flutter/domain/chat/chat_manager.dart';
import 'package:surf_practice_chat_flutter/domain/chat/providers.dart';
import 'package:surf_practice_chat_flutter/pages/page_domain/chat_page_state.dart';
import 'package:surf_practice_chat_flutter/pages/page_domain/providers.dart';
import 'package:surf_practice_chat_flutter/utils/Strings.dart';

class MessageInput extends HookConsumerWidget {
  const MessageInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatManager = ref.watch(chatManagerProvider);
    final chatPageState = ref.watch(chatPageStateHolderProvier);

    final TextEditingController messageController;

    messageController = useTextEditingController();

    //Чтобы не перекрыло снизу на айфонах
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        child: Column(
          children: [
            const Divider(),
            Row(
              children: [
                _SendWithLocationButton(
                  chatManager: chatManager,
                  messageController: messageController,
                ),
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: Strings.messageHint,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                _SendButton(
                  chatPageState: chatPageState,
                  chatManager: chatManager,
                  messageController: messageController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SendWithLocationButton extends StatelessWidget {
  const _SendWithLocationButton({
    Key? key,
    required this.chatManager,
    required this.messageController,
  }) : super(key: key);

  final ChatManager chatManager;
  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.location_on,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () {
        chatManager.sendMessage(
          messageController.text,
          withLocation: true,
        );
      },
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton({
    Key? key,
    required this.chatPageState,
    required this.chatManager,
    required this.messageController,
  }) : super(key: key);

  final ChatPageState chatPageState;
  final ChatManager chatManager;
  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: chatPageState.isProgress
          ? const CircularProgressIndicator()
          : IconButton(
              onPressed: () {
                chatManager.sendMessage(messageController.text);
              },
              icon: const Icon(
                Icons.send,
              ),
            ),
    );
  }
}
