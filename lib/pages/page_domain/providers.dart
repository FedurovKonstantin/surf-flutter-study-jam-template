import 'package:riverpod/riverpod.dart';
import 'package:surf_practice_chat_flutter/domain/chat/providers.dart';
import 'package:surf_practice_chat_flutter/pages/page_domain/chat_page_state.dart';
import 'package:surf_practice_chat_flutter/pages/page_domain/chat_page_state_holder.dart';

final chatPageStateHolderProvier =
    StateNotifierProvider<ChatPageStateHolder, ChatPageState>(
  (ref) => ChatPageStateHolder(
    ref.watch(chatStateHolderProvider),
  ),
);
