import 'package:riverpod/riverpod.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';

import 'chat_page_state.dart';

class ChatPageStateHolder extends StateNotifier<ChatPageState> {
  ChatPageStateHolder([
    ChatPageState? state,
  ]) : super(state ?? ChatPageState());

  void load() => state = state.copyWith(
        isFailured: false,
        isProgress: true,
      );

  void failure() => state = state.copyWith(
        isFailured: true,
        isProgress: false,
      );

  void done() => state = state.copyWith(
        isProgress: false,
      );
}
