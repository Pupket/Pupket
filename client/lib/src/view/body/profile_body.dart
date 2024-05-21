import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('MYLOG build ProfileBody');

    return const Center(
      child: Text(
          "프로필"
      ),
    );
  }
}
