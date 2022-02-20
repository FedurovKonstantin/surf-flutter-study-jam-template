import 'package:riverpod/riverpod.dart';

import 'providers.dart';
import 'user_state_holder.dart';

class UserManager {
  final UserStateHolder _userState;

  UserManager(this._userState);

  void updateNickname(String nickName) => _userState.updateNickname(nickName);
}
