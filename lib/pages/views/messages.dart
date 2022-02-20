import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surf_practice_chat_flutter/data/chat/models/user.dart';
import 'package:surf_practice_chat_flutter/pages/page_domain/chat_page_state.dart';
import 'package:surf_practice_chat_flutter/pages/page_domain/providers.dart';
import 'package:surf_practice_chat_flutter/utils/strings.dart';

import '../../domain/chat/providers.dart';
import '../../domain/user/providers.dart';
import 'chat_message.dart';

class Messages extends ConsumerWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatPageState = ref.watch(chatPageStateHolderProvier);
    //Да, можно было хранить сообщения в pageState, но
    //у меня провайдер диспоузился. Если Вы это видите значит
    //не хватило времени разобраться
    final chatState = ref.watch(chatStateHolderProvider);

    if (chatPageState.isProgress && chatState.isEmpty) {
      return const _LoadingWidget();
    }
    if (chatPageState.isFailured && chatState.isEmpty) {
      return const _ErorView();
    }
    return _MessagesView(
      chatPageState: chatPageState,
    );
  }
}

class _MessagesView extends ConsumerWidget {
  const _MessagesView({
    Key? key,
    required this.chatPageState,
  }) : super(key: key);

  final ChatPageState chatPageState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userStateHolderProvider);
    final chatState = ref.watch(chatStateHolderProvider);

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

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErorView extends StatelessWidget {
  const _ErorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        Strings.serverException,
      ),
    );
  }
}
