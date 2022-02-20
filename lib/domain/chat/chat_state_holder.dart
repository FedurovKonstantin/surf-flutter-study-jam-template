import 'package:riverpod/riverpod.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';

import '../../pages/views/chat_message.dart';

class ChatStateHolder extends StateNotifier<List<ChatMessageDto>> {
  ChatStateHolder([List<ChatMessageDto>? state]) : super(state ?? []);

  void updateMessages(List<ChatMessageDto> messages) => state = messages;
}
