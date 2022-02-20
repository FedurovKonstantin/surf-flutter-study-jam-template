import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surf_practice_chat_flutter/domain/location/location_manager.dart';
import 'package:surf_practice_chat_flutter/domain/location/providers.dart';
import 'package:url_launcher/url_launcher.dart';

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
            location: location,
          ),
        ),
      ],
    );
  }
}

class LocationMessageBody extends ConsumerWidget {
  const LocationMessageBody({
    Key? key,
    required this.isMy,
    required this.author,
    required this.location,
    this.message,
  }) : super(key: key);

  final String author;
  final String? message;
  final bool isMy;
  final ChatGeolocationDto location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationManager = ref.watch(locationManagerProvider);
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
          onPressed: () {
            locationManager.openMap(location);
          },
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
