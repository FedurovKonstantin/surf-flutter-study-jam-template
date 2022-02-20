import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/data/chat/chat.dart';

abstract class ChatPageState {}

class ChatPageStateFailured extends ChatPageState {
  ChatPageStateFailured();
}

class ChatPageStateWithData extends ChatPageState {
  final List<ChatMessageDto> messages;

  ChatPageStateWithData(this.messages);
}

class ChatPageStateInProgress extends ChatPageState {}
