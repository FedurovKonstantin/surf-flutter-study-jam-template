import 'package:riverpod/riverpod.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/user/domain/user_state_holder.dart';

final userStateHolderProvider = StateNotifierProvider(
  (ref) => UserStateHolder(
    ChatUserLocalDto(name: 'qew'),
  ),
);
