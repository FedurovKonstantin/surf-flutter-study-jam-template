import 'package:riverpod/riverpod.dart';
import 'package:surf_practice_chat_flutter/user/domain/user_state_holder.dart';
import 'package:surf_practice_chat_flutter/user/providers.dart';

final userManagerProvider = Provider(
  (ref) => UserManager(
    ref.watch(userStateHolderProvider.notifier),
  ),
);

class UserManager {
  final UserStateHolder _userState;

  UserManager(this._userState);

  void setNickname(String nickName) => _userState.updateUser(nickName);
}
