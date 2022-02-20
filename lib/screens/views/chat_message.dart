import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final String author;

  /// В случае нашего сообщения отображение изменится
  final bool isMy;

  const ChatMessage({
    required this.author,
    required this.message,
    required this.isMy,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        textDirection: isMy ? TextDirection.rtl : TextDirection.ltr,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: Text(
              author[0],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                author,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                message,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
