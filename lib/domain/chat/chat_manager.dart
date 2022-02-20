import 'package:surf_practice_chat_flutter/data/chat/chat.dart';

import '../user/user_state_holder.dart';
import 'chat_state_holder.dart';

class ChatManager {
  final ChatRepository _chatRepository;
  final UserStateHolder _userState;
  final ChatStateHolder _chatState;

  ChatManager(
    this._chatRepository,
    this._userState,
    this._chatState,
  );

  Future<void> init() async {
    try {
      final messages = await _chatRepository.messages;
      _chatState.updateMessages(messages);
    } catch (e) {}
  }

  Future<void> updateMessages() async {
    try {
      final messages = await _chatRepository.messages;
      _chatState.updateMessages(messages);
    } catch (e) {}
  }

  Future<void> sendMessage(String message) async {
    try {
      final nickname = _userState.nickname;
      await _chatRepository.sendMessage(nickname, message);
      final messages = await _chatRepository.messages;
      _chatState.updateMessages(messages);
    } on Exception catch (e) {}
  }
}
