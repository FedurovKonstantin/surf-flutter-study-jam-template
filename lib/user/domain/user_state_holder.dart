import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';

import '../../data/chat/models/user.dart';

class UserStateHolder extends StateNotifier<ChatUserDto> {
  UserStateHolder(ChatUserDto state) : super(state);

  void updateUser(ChatUserDto newUser) => state = newUser;

  String get nickname => state.name;
}
