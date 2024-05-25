import 'package:flutter/material.dart';
import 'package:potenday/src/config/color_set.dart';
import 'package:potenday/src/config/global_variables.dart';
import 'package:potenday/src/provider/user_mode_provider.dart';
import 'package:provider/provider.dart';

class AppHeader extends StatefulWidget implements PreferredSizeWidget {
  static const double defaultHeight = 120;
  bool isCancel;
  bool isAlarm;

  AppHeader({
    super.key,
    required this.isCancel,
    required this.isAlarm,
  });

  @override
  State<AppHeader> createState() => _AppHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(defaultHeight);
}

class _AppHeaderState extends State<AppHeader> {
  @override

  @override
  Widget build(BuildContext context) {
    final UserModeProvider userModeProvider = Provider.of<UserModeProvider>(context);
    final deviceWidth = GlobalVariables.width;
    final deviceHeight = GlobalVariables.height;

    return Container(
        height: AppHeader.defaultHeight * 0.65,
        padding: EdgeInsets.only(left: 13, right: 19),
        decoration: BoxDecoration(
          color: userModeProvider.backgroundColor,
        ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.isCancel ? InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 26),
            ) : const SizedBox(),
            Image.asset(userModeProvider.isGuardian % 2 == 1 ? 'assets/images/light_screen_text_logo.png' : 'assets/images/dark_screen_text_logo.png', width: 84),
            widget.isAlarm ? InkWell(
                onTap: () {

                },
                child: Image.asset(
                    'assets/images/alarm_icon.png',
                    width: 37.25)) : const SizedBox(),
          ],
        ),
      )
    );
  }
}
