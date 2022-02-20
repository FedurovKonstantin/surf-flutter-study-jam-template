import 'package:flutter/material.dart';

import '../../data/chat/models/geolocation.dart';
import 'chat_message.dart';

class ChatMessageLocation extends StatelessWidget {
  final String? message;
  final String author;
  final ChatGeolocationDto location;

  /// В случае нашего сообщения отображение изменится
  final bool isMy;

  const ChatMessageLocation({
    this.message,
    required this.author,
    required this.location,
    required this.isMy,
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: isMy ? TextDirection.rtl : TextDirection.ltr,
      children: [
        Avatar(
          author: author,
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: LocationMessageBody(
            isMy: isMy,
            author: author,
            message: message,
          ),
        ),
      ],
    );
  }
}

class LocationMessageBody extends StatelessWidget {
  const LocationMessageBody({
    Key? key,
    required this.isMy,
    required this.author,
    this.message,
  }) : super(key: key);

  final String author;
  final String? message;
  final bool isMy;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMy ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: author,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            children: const <TextSpan>[
              TextSpan(text: 'поделился геолокацией'),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Открыть в картах'),
        ),
        if (message != null)
          Text(
            message!,
          ),
      ],
    );
  }
}
