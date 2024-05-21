import 'package:flutter/material.dart';

class MyWalkBody extends StatefulWidget {
  const MyWalkBody({super.key});

  @override
  State<MyWalkBody> createState() => _MyWalkBodyState();
}

class _MyWalkBodyState extends State<MyWalkBody> {
  @override
  Widget build(BuildContext context) {
    debugPrint('MYLOG build HistoryBody');

    return const Center(
      child: Text(
          "내역"
      ),
    );
  }
}
