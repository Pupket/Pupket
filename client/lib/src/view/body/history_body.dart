import 'package:flutter/material.dart';

class HistoryBody extends StatefulWidget {
  const HistoryBody({super.key});

  @override
  State<HistoryBody> createState() => _HistoryBodyState();
}

class _HistoryBodyState extends State<HistoryBody> {
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
