import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surf_practice_chat_flutter/domain/user/user_state_holder.dart';

import '../../data/chat/models/user.dart';
import 'user_manager.dart';

final userStateHolderProvider = StateNotifierProvider<UserStateHolder, ChatUserDto>(
  (ref) => UserStateHolder(),
);
final userManagerProvider = Provider(
  (ref) => UserManager(
    ref.watch(userStateHolderProvider.notifier),
  ),
);
