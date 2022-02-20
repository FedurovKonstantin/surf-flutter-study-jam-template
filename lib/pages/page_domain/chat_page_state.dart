import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:surf_practice_chat_flutter/data/chat/chat.dart';

part 'chat_page_state.freezed.dart';

@freezed
class ChatPageState with _$ChatPageState {
  factory ChatPageState({
    @Default(false) bool isProgress,
    @Default(false) bool isFailured,
  }) = _ChatPageState;
}
