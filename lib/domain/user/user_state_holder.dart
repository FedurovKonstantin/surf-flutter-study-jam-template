import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';

import '../../data/chat/models/user.dart';

class UserStateHolder extends StateNotifier<ChatUserDto?> {
  UserStateHolder(ChatUserDto state) : super(state);

  void updateUser(String nickname) => state = ChatUserLocalDto(name: nickname);

  String get nickname => state?.name ?? '';
}
