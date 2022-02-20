import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/domain/chat_state_holder.dart';
import 'package:surf_practice_chat_flutter/user/domain/user_state_holder.dart';

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

  Future<void> sendMessage(String message) async {
    try {
      final nickname = _userState.nickname;
      final messages = await _chatRepository.sendMessage(nickname, message);
      _chatState.updateMessages(messages);
    } on Exception catch (e) {}
  }
}
