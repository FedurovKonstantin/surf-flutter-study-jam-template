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
          child: MessageBody(
            isMy: isMy,
            author: author,
            message: message,
          ),
        ),
      ],
    );
  }
}

class MessageBody extends StatelessWidget {
  const MessageBody({
    Key? key,
    required this.isMy,
    required this.author,
    required this.message,
  }) : super(key: key);

  final String author;
  final String message;
  final bool isMy;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMy ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          author,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          softWrap: true,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          message,
        ),
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.author,
  }) : super(key: key);

  final String author;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          author[0].toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
