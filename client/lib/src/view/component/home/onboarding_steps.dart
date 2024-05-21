import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potenday/src/config/global_variables.dart';
import 'package:potenday/src/provider/bottom_navigation_bar_provider.dart';
import 'package:potenday/src/util/custom_basic_container.dart';
import 'package:provider/provider.dart';

class OnboardingSteps extends StatefulWidget {
  const OnboardingSteps({super.key});

  @override
  State<OnboardingSteps> createState() => _OnboardingStepsState();
}

class _OnboardingStepsState extends State<OnboardingSteps> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _personalityController = TextEditingController();
  final TextEditingController _significantController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _breedController.dispose();
    _yearController.dispose();
    _monthController.dispose();
    _dayController.dispose();
    _weightController.dispose();
    _personalityController.dispose();
    _significantController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = GlobalVariables.width;
    final double deviceHeight = GlobalVariables.height;

    debugPrint('궯세로 ${deviceHeight * 0.12}');
    debugPrint('궯가로 ${deviceWidth * 0.023}');

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(deviceWidth * 0.062, deviceHeight * 0.0218, deviceWidth * 0.062, deviceHeight * 0.0605),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '반려견 프로필 등록',
              style: TextStyle(
                color: Color(0xFF4C433F),
                fontSize: 15,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: deviceHeight * 0.0194),
            Center(child: Image.asset('assets/images/select_profile.png', width: deviceWidth * 0.245)),
            SizedBox(height: deviceHeight * 0.0448),
            const Text(
              '반려견 이름 입력',
              style: TextStyle(
                color: Color(0xFF4C433F),
                fontSize: 12,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: deviceHeight * 0.0061),
            CustomBasicContainer(
              width: deviceWidth * 0.871,
              height: deviceHeight * 0.0581,
              color: Colors.white,
              circularBorderRadius: 10,
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: '반려견 이름을 입력하세요',
                  hintStyle: const TextStyle(
                    color: Color(0xFF4C433F),
                    fontSize: 15,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.026),
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
            SizedBox(height: deviceHeight * 0.0424),
            const Text(
              '견종 입력',
              style: TextStyle(
                color: Color(0xFF4C433F),
                fontSize: 12,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: deviceHeight * 0.0061),
            CustomBasicContainer(
              width: deviceWidth * 0.871,
              height: deviceHeight * 0.0581,
              color: Colors.white,
              circularBorderRadius: 10,
              child: TextField(
                controller: _breedController,
                decoration: InputDecoration(
                  hintText: '반려견의 종을 입력하세요',
                  hintStyle: const TextStyle(
                    color: Color(0xFF4C433F),
                    fontSize: 15,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.026),
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
            SizedBox(height: deviceHeight * 0.0424),
            const Text(
              '성별',
              style: TextStyle(
                color: Color(0xFF4C433F),
                fontSize: 12,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: deviceHeight * 0.0061),
            Row(
              children: [
                CustomBasicContainer(
                  width: deviceWidth * 0.408,
                  height: deviceHeight * 0.0581,
                  color: Colors.white,
                  circularBorderRadius: 10,
                  child: const Text(
                    '수컷',
                    style: TextStyle(
                      color: Color(0x7F4C433F),
                      fontSize: 15,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(width: deviceWidth * 0.059),
                CustomBasicContainer(
                  width: deviceWidth * 0.408,
                  height: deviceHeight * 0.0581,
                  color: Colors.white,
                  circularBorderRadius: 10,
                  child: const Text(
                    '암컷',
                    style: TextStyle(
                      color: Color(0x7F4C433F),
                      fontSize: 15,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: deviceHeight * 0.0424),
            const Text(
              '나이 입력',
              style: TextStyle(
                color: Color(0xFF4C433F),
                fontSize: 12,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: deviceHeight * 0.0061),
            Row(
              children: [
                CustomBasicContainer(
                  width: deviceWidth * 0.337,
                  height: deviceHeight * 0.0581,
                  color: Colors.white,
                  circularBorderRadius: 10,
                  child: TextField(
                    controller: _yearController,
                    decoration: InputDecoration(
                      hintText: '연도',
                      hintStyle: const TextStyle(
                        color: Color(0xFF4C433F),
                        fontSize: 15,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.026),
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
                SizedBox(width: deviceWidth * 0.023),
                CustomBasicContainer(
                  width: deviceWidth * 0.245,
                  height: deviceHeight * 0.0581,
                  color: Colors.white,
                  circularBorderRadius: 10,
                  child: TextField(
                    controller: _monthController,
                    decoration: InputDecoration(
                      hintText: '월',
                      hintStyle: const TextStyle(
                        color: Color(0xFF4C433F),
                        fontSize: 15,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.026),
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
                SizedBox(width: deviceWidth * 0.023),
                CustomBasicContainer(
                  width: deviceWidth * 0.245,
                  height: deviceHeight * 0.0581,
                  color: Colors.white,
                  circularBorderRadius: 10,
                  child: TextField(
                    controller: _dayController,
                    decoration: InputDecoration(
                      hintText: '일',
                      hintStyle: const TextStyle(
                        color: Color(0xFF4C433F),
                        fontSize: 15,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.026),
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
              ],
            ),
            SizedBox(height: deviceHeight * 0.0424),
            const Text(
              '무게 입력',
              style: TextStyle(
                color: Color(0xFF4C433F),
                fontSize: 12,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: deviceHeight * 0.0061),
            CustomBasicContainer(
              width: deviceWidth * 0.871,
              height: deviceHeight * 0.0581,
              color: Colors.white,
              circularBorderRadius: 10,
              child: TextField(
                controller: _weightController,
                decoration: InputDecoration(
                  hintText: '반려견의 무게를 입력하세요',
                  hintStyle: const TextStyle(
                    color: Color(0xFF4C433F),
                    fontSize: 15,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.026),
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
            SizedBox(height: deviceHeight * 0.0424),
            const Text(
              '예방접종 여부',
              style: TextStyle(
                color: Color(0xFF4C433F),
                fontSize: 12,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: deviceHeight * 0.0061),
            Row(
              children: [
                CustomBasicContainer(
                  width: deviceWidth * 0.408,
                  height: deviceHeight * 0.0581,
                  color: Colors.white,
                  circularBorderRadius: 10,
                  child: const Text(
                    '했어요',
                    style: TextStyle(
                      color: Color(0x7F4C433F),
                      fontSize: 15,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(width: deviceWidth * 0.059),
                CustomBasicContainer(
                  width: deviceWidth * 0.408,
                  height: deviceHeight * 0.0581,
                  color: Colors.white,
                  circularBorderRadius: 10,
                  child: const Text(
                    '안했어요',
                    style: TextStyle(
                      color: Color(0x7F4C433F),
                      fontSize: 15,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: deviceHeight * 0.0424),
            const Text(
              '반려견 성격 태그',
              style: TextStyle(
                color: Color(0xFF4C433F),
                fontSize: 12,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: deviceHeight * 0.0061),
            CustomBasicContainer(
              width: deviceWidth * 0.871,
              height: deviceHeight * 0.12,
              color: Colors.white,
              circularBorderRadius: 10,
              child: TextField(
                controller: _personalityController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
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
            SizedBox(height: deviceHeight * 0.0424),
            const Text(
              '반려견 특이사항',
              style: TextStyle(
                color: Color(0xFF4C433F),
                fontSize: 12,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: deviceHeight * 0.0061),
            CustomBasicContainer(
              width: deviceWidth * 0.871,
              height: deviceHeight * 0.12,
              color: Colors.white,
              circularBorderRadius: 10,
              child: TextField(
                controller: _significantController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: '반려견의 특이사항을 입력하세요(최대 500자)',
                  hintStyle: const TextStyle(
                    color: Color(0xFF4C433F),
                    fontSize: 15,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.026),

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
          ],
        ),
      ),
    );
  }
}
