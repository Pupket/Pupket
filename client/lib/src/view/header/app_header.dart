import 'package:flutter/material.dart';
import 'package:potenday/src/config/color_set.dart';
import 'package:potenday/src/config/global_variables.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  static const double defaultHeight = 120;
  const AppHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(defaultHeight);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = GlobalVariables.width;
    final deviceHeight = GlobalVariables.height;

    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          height: defaultHeight * 0.65,
          decoration: const BoxDecoration(
            color: CustomColor.backgroundColor,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey,
            //     blurRadius: 10,
            //     spreadRadius: 5
            //   ),
            // ],
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/images/app_header_add_account.png', width: 37.25),
              ],
            ),
          )
        ),
      ],
    );
  }
}
