import 'package:riverpod/riverpod.dart';
import 'package:surf_practice_chat_flutter/domain/location/location_manager.dart';

final locationManagerProvider = Provider(
  (ref) => LocationManager(),
);
