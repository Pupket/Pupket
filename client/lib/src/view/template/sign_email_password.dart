import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:potenday/src/config/global_variables.dart';
import 'package:potenday/src/provider/user_mode_provider.dart';
import 'package:potenday/src/util/custom_basic_container.dart';
import 'package:potenday/src/util/default_next_button.dart';
import 'package:potenday/src/view/component/take_walk/detail_take_walk.dart';
import 'package:potenday/src/view/header/app_header.dart';
import 'package:potenday/src/view/template/sign_profile.dart';
import 'package:provider/provider.dart';
import 'package:transition/transition.dart';

class SignEmailPassword extends StatefulWidget {
  const SignEmailPassword({super.key});

  @override
  State<SignEmailPassword> createState() => _SignEmailPasswordState();
}

class _SignEmailPasswordState extends State<SignEmailPassword> {
  late UserModeProvider userModeProvider;
  final double deviceWidth = GlobalVariables.width;
  final double deviceHeight = GlobalVariables.height;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _verifyPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userModeProvider = Provider.of<UserModeProvider>(context);

    return SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
          backgroundColor: userModeProvider.backgroundColor,
          appBar: AppHeader(isCancel: true, isAlarm: false),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 53, 16, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '이메일과 이름, 비밀번호를 입력하세요',
                      style: TextStyle(
                        color: Color(0xFF4C433F),
                        fontSize: 15,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 36),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '이메일',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                CustomBasicContainer(
                  width: 343,
                  height: 48,
                  color: Colors.white,
                  circularBorderRadius: 10,
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Color(0xFF4C433F),
                      fontSize: 15,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: InputDecoration(
                      hintText: '이메일 주소 입력하기',
                      hintStyle: const TextStyle(
                        color: Color(0x7F4C433F),
                        fontSize: 15,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4C433F), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 58),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '비밀번호',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                CustomBasicContainer(
                  width: 343,
                  height: 48,
                  color: Colors.white,
                  circularBorderRadius: 10,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(
                      color: Color(0xFF4C433F),
                      fontSize: 15,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: InputDecoration(
                      hintText: '6~15자 이내의 비밀번호',
                      hintStyle: const TextStyle(
                        color: Color(0x7F4C433F),
                        fontSize: 15,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4C433F), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 34),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '비밀번호 확인',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                CustomBasicContainer(
                  width: 343,
                  height: 48,
                  color: Colors.white,
                  circularBorderRadius: 10,
                  child: TextField(
                    controller: _verifyPasswordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(
                      color: Color(0xFF4C433F),
                      fontSize: 15,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: InputDecoration(
                      hintText: '6~15자 이내의 비밀번호',
                      hintStyle: const TextStyle(
                        color: Color(0x7F4C433F),
                        fontSize: 15,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4C433F), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 116),
                InkWell(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: DefaultNextButton(
                      width: 347,
                      height: 60,
                      onTapCallback: () {
                        Navigator.push(
                          context,
                          Transition(
                            child: SingProfile(),
                            transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
