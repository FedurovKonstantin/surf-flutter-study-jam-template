import 'package:riverpod/riverpod.dart';

import '../data/chat/models/message.dart';

final chatStateHolderProvider = StateNotifierProvider(
  ((ref) => ChatStateHolder()),
);

class ChatStateHolder extends StateNotifier<List<ChatMessageDto>> {
  ChatStateHolder([List<ChatMessageDto>? state]) : super(state ?? []);

  void updateMessages(List<ChatMessageDto> messages) => state += messages;
}
