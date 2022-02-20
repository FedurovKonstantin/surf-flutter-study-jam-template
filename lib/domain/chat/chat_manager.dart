import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/domain/ui/ui_exception_manager.dart';
import 'package:surf_practice_chat_flutter/utils/strings.dart';

import '../user/user_state_holder.dart';
import 'chat_state_holder.dart';

class ChatManager {
  final ChatRepository _chatRepository;
  final UserStateHolder _userState;
  final ChatStateHolder _chatState;
  final UIExceptionManager _uiExceptionManager;

  ChatManager(
    this._chatRepository,
    this._userState,
    this._chatState,
    this._uiExceptionManager,
  );

  Future<void> init() async {
    await updateMessages();
  }

  Future<void> updateMessages() async {
    try {
      final messages = await _chatRepository.messages;
      _chatState.updateMessages(messages);
    } on Exception catch (e) {
      _uiExceptionManager.showSnackbar(e.toString());
    }
  }

  Future<void> sendMessage(String message) async {
    try {
      final nickname = _userState.nickname;

      final messages = await _chatRepository.sendMessage(nickname, message);
      _chatState.updateMessages(messages);
    } on InvalidNameException catch (e) {
      _uiExceptionManager.showSnackbar(Strings.invalidNameExceptionMessage);
    } on InvalidMessageException catch (e) {
      _uiExceptionManager.showSnackbar(Strings.invalidNameExceptionMessage);
    }
  }
}
