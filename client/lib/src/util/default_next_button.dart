import 'package:flutter/material.dart';
import 'package:potenday/src/util/custom_basic_container.dart';

class DefaultNextButton extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final Function onTapCallback;
  const DefaultNextButton({
    super.key,
    required this.width,
    required this.height,
    this.title = '다음',
    required this.onTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapCallback(),
      child: CustomBasicContainer(
        width: width,
        height: height,
        color: const Color(0xFF4B433E),
        circularBorderRadius: 60,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'NotoSansKR',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
