import 'package:riverpod/riverpod.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';

import 'chat_page_state.dart';

class ChatPageStateHolder extends StateNotifier<ChatPageState> {
  final List<ChatMessageDto> _chatState;

  ChatPageStateHolder(
    this._chatState, [
    ChatPageState? state,
  ]) : super(state ?? ChatPageStateInProgress());

  bool get _chatMessagesIsNotEmpty => _chatState.isNotEmpty;

  void load() {
    if (_chatMessagesIsNotEmpty) {
      state = ChatPageStateInProgress();
    }
  }

  void failure() {
    if (_chatMessagesIsNotEmpty) {
      state = ChatPageStateFailured();
    }
  }

  void done() => state = ChatPageStateWithData(_chatState);
}
