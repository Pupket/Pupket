import 'package:flutter/material.dart';

class MateBody extends StatefulWidget {
  const MateBody({super.key});

  @override
  State<MateBody> createState() => _MateBodyState();
}

class _MateBodyState extends State<MateBody> {
  @override
  Widget build(BuildContext context) {
    debugPrint('MYLOG build MateBody');

    return const Center(
      child: Text(
          "메이트"
      ),
    );
  }
}
