import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:potenday/src/config/global_variables.dart';
import 'package:potenday/src/provider/user_mode_provider.dart';
import 'package:potenday/src/util/custom_basic_container.dart';
import 'package:potenday/src/view/header/app_header.dart';
import 'package:provider/provider.dart';
import 'package:transition/transition.dart';

class DetailTakeWalk extends StatefulWidget {
  const DetailTakeWalk({super.key});

  @override
  State<DetailTakeWalk> createState() => _DetailTakeWalkState();
}

class _DetailTakeWalkState extends State<DetailTakeWalk> {
  late UserModeProvider userModeProvider;

  final double deviceWidth = GlobalVariables.width;
  final double deviceHeight = GlobalVariables.height;
  final TextEditingController _moneyController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();


  String _wageType = '선택';

  List<String> wageTypeSlots = ['시급', '건당'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _moneyController.dispose();
    _placeController.dispose();
    _phoneNumController.dispose();
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
        appBar: AppHeader(isCancel: true, isAlarm: true),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(14, 28, 14, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '세부 정보를\n입력해주세요',
                        style: TextStyle(
                          color: Color(0xFF1F1F1F),
                          fontSize: 24,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 54),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '임금',
                        style: TextStyle(
                          color: Color(0xFF1F1F1F),
                          fontSize: 16,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomBasicContainer(
                    width: 166,
                    height: 53,
                    color: Colors.white,
                    circularBorderRadius: 10,
                    border: Border.all(color: const Color(0xFF4C433F), width: 1),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 19, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                _wageType,
                                style: const TextStyle(
                                  color: Color(0xFF1F1F1F),
                                  fontSize: 12,
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 60),
                              PopupMenuButton<String>(
                                color: Colors.white,

                                icon: const Icon(Icons.keyboard_arrow_down_sharp, size: 25),
                                onSelected: (String value) {
                                  setState(() {
                                    _wageType = value;
                                  });
                                },
                                itemBuilder: (BuildContext context) {
                                  return [
                                    PopupMenuItem<String>(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: wageTypeSlots.map((String choice) {
                                            return ListTile(
                                              title: Text(
                                                choice,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'NotoSansKR',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  _wageType = choice;
                                                  Navigator.pop(context);
                                                });
                                              },
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    )
                                  ];
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Stack(
                    children: [
                      CustomBasicContainer(
                          width: 166,
                          height: 53,
                          padding: const EdgeInsets.only(right: 44),
                          color: Colors.white,
                          circularBorderRadius: 10,
                        border: Border.all(color: const Color(0xFF4C433F), width: 1),
                        child: TextField(
                          controller: _moneyController,
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.number, // 숫자만 입력되도록 설정
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly], // 숫자만 입력되도록 설정
                          style: const TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w500,
                          ),
                          onChanged: (value) {
                            // 입력된 값에 쉼표 추가
                            final formatter = NumberFormat('#,###');
                            final newValue = formatter.format(int.parse(value.replaceAll(',', '')));
                            if (_moneyController.text != newValue) {
                              _moneyController.value = _moneyController.value.copyWith(
                                text: newValue,
                                selection: TextSelection.collapsed(offset: newValue.length),
                              );
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: '15,000',
                            hintStyle: TextStyle(
                              color: Color(0xFF4C433F),
                              fontSize: 12,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 18,
                        right: 18,
                        child: Text(
                          '원',
                          style: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 45),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Text(
                    '산책 장소 추천',
                    style: TextStyle(
                      color: Color(0xFF1F1F1F),
                      fontSize: 16,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 9),
              CustomBasicContainer(
                width: 347,
                height: 53,
                color: Color(0xFFFBFBFB),
                circularBorderRadius: 10,
                border: Border.all(color: Color(0xFF4B433E), width: 1),
                child: TextField(
                  controller: _placeController,
                  style: const TextStyle(
                    color: Color(0xFF1F1F1F),
                    fontSize: 12,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                  hintText: '한강공원',
                  hintStyle: const TextStyle(
                    color: Color(0xFF4C433F),
                    fontSize: 12,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w400,
                  ),
                    border: InputBorder.none,
                ),
                ),
              ),
              SizedBox(height: 28),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    '연락처',
                    style: TextStyle(
                      color: Color(0xFF1F1F1F),
                      fontSize: 16,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 26),
              CustomBasicContainer(
                width: 347,
                height: 53,
                color: Color(0xFFFBFBFB),
                circularBorderRadius: 10,
                border: Border.all(color: Color(0xFF4B433E), width: 1),
                child: TextField(
                  controller: _phoneNumController,
                  style: const TextStyle(
                    color: Color(0xFF1F1F1F),
                    fontSize: 12,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    hintText: '010-1234-5678',
                    hintStyle: const TextStyle(
                      color: Color(0xFF4C433F),
                      fontSize: 12,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 29),
              InkWell(
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const CustomBasicContainer(
                    width: 347,
                    height: 60,
                    color: Color(0xFF4B433E),
                    circularBorderRadius: 60,
                    child: Text(
                      '작성 완료',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
