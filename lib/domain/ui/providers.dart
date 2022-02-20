import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:surf_practice_chat_flutter/domain/ui/ui_exception_manager.dart';

// ignore: non_constant_identifier_names
final UIExceptionManagerProvider = Provider<UIExceptionManager>(
  (ref) => UIExceptionManager(ref.watch(scaffoldMessangerKeyProvider)),
);

final scaffoldMessangerKeyProvider = Provider(
  (ref) => GlobalKey<ScaffoldMessengerState>(),
);
