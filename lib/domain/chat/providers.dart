import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/firebase.dart';
import 'package:surf_practice_chat_flutter/domain/ui/providers.dart';
import '../user/providers.dart';
import 'chat_manager.dart';
import 'chat_state_holder.dart';

final chatManagerProvider = Provider(
  (ref) => ChatManager(
    ref.watch(chatRepositoryProvider),
    ref.watch(userStateHolderProvider.notifier),
    ref.watch(chatStateHolderProvider.notifier),
    ref.watch(UIExceptionManagerProvider),
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

final chatStateHolderProvider =
    StateNotifierProvider<ChatStateHolder, List<ChatMessageDto>>(
  ((ref) => ChatStateHolder()),
);
