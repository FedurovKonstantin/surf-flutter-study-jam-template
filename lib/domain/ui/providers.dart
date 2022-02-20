import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:surf_practice_chat_flutter/domain/ui/ui_exception_manager.dart';

final UIExceptionManagerProvider = Provider<UIExceptionManager>(
  (ref) => UIExceptionManager(ref.watch(scaffoldMessangerKeyProvider)),
);

final scaffoldMessangerKeyProvider = Provider(
  (ref) => GlobalKey<ScaffoldMessengerState>(),
);
