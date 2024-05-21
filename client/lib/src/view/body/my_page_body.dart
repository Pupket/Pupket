import 'package:flutter/material.dart';

class MyPageBody extends StatefulWidget {
  const MyPageBody({super.key});

  @override
  State<MyPageBody> createState() => _MyPageBodyState();
}

class _MyPageBodyState extends State<MyPageBody> {
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
