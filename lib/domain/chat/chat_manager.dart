import 'package:location/location.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/domain/location/location_manager.dart';
import 'package:surf_practice_chat_flutter/domain/ui/ui_exception_manager.dart';
import 'package:surf_practice_chat_flutter/pages/page_domain/chat_page_state_holder.dart';
import 'package:surf_practice_chat_flutter/utils/strings.dart';

import '../user/user_state_holder.dart';
import 'chat_state_holder.dart';

class ChatManager {
  final ChatRepository _chatRepository;
  final UserStateHolder _userState;
  final ChatStateHolder _chatState;
  final UIExceptionManager _uiExceptionManager;
  final ChatPageStateHolder _chatPageState;
  final LocationManager _locationManager;

  ChatManager(
    this._chatRepository,
    this._userState,
    this._chatState,
    this._uiExceptionManager,
    this._chatPageState,
    this._locationManager,
  );

  Future<void> init() async {
    await updateMessages();
  }

  Future<void> updateMessages() async {
    _chatPageState.load();
    try {
      final messages = await _chatRepository.messages;
      _chatState.updateMessages(messages);
      _chatPageState.done();
    } on Exception catch (e) {
      _uiExceptionManager.showSnackbar(e.toString());
      _chatPageState.failure();
    }
  }

  Future<void> sendMessage(
    String message, {
    bool withLocation = false,
  }) async {
    _chatPageState.load();
    LocationData? location;
    if (withLocation) {
      location = await _locationManager.getLocation();
    }

    try {
      final nickname = _userState.nickname;
      final messages;

      if (location != null) {
        messages = await _chatRepository.sendGeolocationMessage(
          nickname: nickname,
          location: ChatGeolocationDto(
            latitude: location.latitude ?? 0,
            longitude: location.longitude ?? 0,
          ),
        );
      } else {
        messages = await _chatRepository.sendMessage(nickname, message);
      }

      _chatState.updateMessages(messages);
    } on InvalidNameException catch (_) {
      _uiExceptionManager.showSnackbar(Strings.invalidNameExceptionMessage);
    } on InvalidMessageException catch (_) {
      _uiExceptionManager.showSnackbar(Strings.invalidMessageExceptionMessage);
    } on Exception catch (e) {
      _uiExceptionManager.showSnackbar(e.toString());
    }
    _chatPageState.done();
  }

  Future<void> sendWithLocation() async {}
}
