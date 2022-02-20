import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/firebase.dart';
import 'package:surf_practice_chat_flutter/domain/chat_manager.dart';
import 'package:surf_practice_chat_flutter/domain/chat_state_holder.dart';
import 'package:surf_practice_chat_flutter/user/providers.dart';

final chatManagerProvider = Provider(
  (ref) => ChatManager(
    ref.watch(chatRepositoryProvider),
    ref.watch(userStateHolderProvider.notifier),
    ref.watch(chatStateHolderProvider.notifier),
  ),
);

final chatRepositoryProvider = Provider<ChatRepository>(
  (ref) => ChatRepositoryFirebase(
    ref.watch(firebaseClientProvider),
  ),
);

final firebaseClientProvider = Provider(
  (ref) => FirebaseFirestore.instance,
);
