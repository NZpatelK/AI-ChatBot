import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.text,
    required this.isFromUser,
  });

  final String text;
  final bool isFromUser;

  @override

  Widget build(BuildContext context) {
    final color = isFromUser ? Colors.blueAccent : const Color(0xFFDFDFDF);
    final borderRadius = BorderRadius.only(
      topLeft: const Radius.circular(10),
      bottomLeft: isFromUser ? const Radius.circular(10) : Radius.zero,
      topRight: const Radius.circular(10),
      bottomRight: isFromUser ? Radius.zero : const Radius.circular(10),
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 15).copyWith(
        left: isFromUser ? 100 : 10,
        right: isFromUser ? 10 : 100,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: MarkdownBody(
        data: text,
        styleSheet: MarkdownStyleSheet(
          p: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          h1: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
