import 'package:flutter/material.dart';
import 'package:potenday/src/provider/user_mode_provider.dart';
import 'package:potenday/src/util/custom_basic_container.dart';
import 'package:potenday/src/view/template/sign_email_password.dart';
import 'package:provider/provider.dart';
import 'package:transition/transition.dart';

class LoginTemplate extends StatelessWidget {
  const LoginTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    UserModeProvider userModeProvider = Provider.of<UserModeProvider>(context);

    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        backgroundColor: userModeProvider.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/light_screen_dog.png', width: 125),
              SizedBox(height: 36),
              Text(
                '반려동물 안심 산책 메이트,',
                style: TextStyle(
                  color: Color(0xFF4C433F),
                  fontSize: 13,
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Image.asset('assets/images/light_screen_text_logo.png'),
              SizedBox(height: 91),
              InkWell(
                onTap: () {

                },
                child: Image.asset('assets/images/naver_sign_up.png', width: 316),
              ),
              SizedBox(height: 12),
              InkWell(
                onTap: () {

                },
                child: Image.asset('assets/images/kakao_sign_up.png', width: 316),
              ),
              SizedBox(height: 12),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    Transition(
                      child: SignEmailPassword(),
                      transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                    ),
                  );
                },
                child: Image.asset('assets/images/email_sign_up.png', width: 316),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
