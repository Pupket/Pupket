import 'package:flutter/material.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    debugPrint('MYLOG build ChatBody');

    return const Center(
      child: Text(
        "채팅"
      ),
    );
  }
}
