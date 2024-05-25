import 'package:flutter/material.dart';
import 'package:potenday/src/config/global_variables.dart';
import 'package:potenday/src/provider/user_mode_provider.dart';
import 'package:potenday/src/util/custom_basic_container.dart';
import 'package:potenday/src/view/component/take_walk/day_take_walk.dart';
import 'package:potenday/src/view/header/app_header.dart';
import 'package:provider/provider.dart';
import 'package:transition/transition.dart';

class SelectTakeWalk extends StatefulWidget {
  const SelectTakeWalk({super.key});

  @override
  State<SelectTakeWalk> createState() => _SelectTakeWalkState();
}

class _SelectTakeWalkState extends State<SelectTakeWalk> {
  late UserModeProvider userModeProvider;

  final double deviceWidth = GlobalVariables.width;
  final double deviceHeight = GlobalVariables.height;

  // 서버에서 받아온 데이터
  List<Map<String, String>> items = [
    {"image": "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMDRfNTUg%2FMDAxNzA0MzM0Njg0NjEz.rbvyicVGHsxWovvEz62x14-0DwoQq3hNPzVomLe18M0g.BWJGdo7HENTSynAkCvB7WvD3lM7NGJSh6jLT6Y-_UN0g.PNG.oneflora%2F00014-1223653379.png&type=sc960_832", "name": "뽀삐", "breed": "웰시코기", "age": "3살"},
    {"name": "멍멍이", "breed": "진돗개", "age": "2살"},
    // {"name": "쿠키", "breed": "말티즈", "age": "5살"},
  ];

  List<int> selectedItemIndexes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
          padding: const EdgeInsets.fromLTRB(14, 28, 14, 134),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text(
                        '산책을 함께 할\n반려견을 선택해주세요',
                        style: TextStyle(
                          color: Color(0xFF1F1F1F),
                          fontSize: 24,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 19),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '전체 선택',
                          style: TextStyle(
                            color: Color(0xFF818181),
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 3),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedItemIndexes.length == items.length) {
                                selectedItemIndexes.clear();
                              } else {
                                selectedItemIndexes.clear();
                                selectedItemIndexes.addAll(List.generate(items.length, (index) => index));
                              }
                            });
                          },
                          child: Icon(
                            selectedItemIndexes.length == items.length ? Icons.check_circle : Icons.check_circle_outline_rounded,
                            size: 24,
                            color: selectedItemIndexes.length == items.length ? Color(0xFF4C433F) : Color(0xFF828282),
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 27),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 14,
                        childAspectRatio: 347 / 80,
                      ),
                      itemCount: items.length > 3 ? 3 : items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomBasicContainer(
                          width: 347,
                          height: 80,
                          color: Color(0xFFF8F8F8),
                          circularBorderRadius: 10,
                          border: Border.all(color: Color(0xFF4B433E)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  setState(() {
                                    if (selectedItemIndexes.contains(index)) {
                                      selectedItemIndexes.remove(index);
                                    } else {
                                      selectedItemIndexes.add(index);
                                    }
                                  });
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipOval(
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(items[index]["image"] ?? ""),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            items[index]["name"] ?? "",
                                            style: TextStyle(
                                              color: Color(0xFF1F1F1F),
                                              fontSize: 16,
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                          Text(
                                            "${items[index]["breed"]} / ${items[index]["age"]}",
                                            style: TextStyle(
                                              color: Color(0xFF818181),
                                              fontSize: 12,
                                              fontFamily: 'NotoSansKR',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    selectedItemIndexes.contains(index) ? Icons.check_circle : Icons.check_circle_outline_rounded,
                                    size: 24,
                                    color: selectedItemIndexes.contains(index) ? const Color(0xFF4C433F) : const Color(0xFF828282),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (items.length < 3)
                    SizedBox(height: 12),
                  if (items.length < 3)
                    InkWell(
                      onTap: () {
                        // 추가하기 버튼 동작
                      },
                      child: CustomBasicContainer(
                        width: 347,
                        height: 80,
                        color: Color(0xFFDED2C4),
                        circularBorderRadius: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 20,
                              color: Color(0xFF828282),
                            ),
                            Text(
                              '추가하기',
                              style: TextStyle(
                                color: Color(0xFF818181),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    Transition(
                      child: DayTakeWalk(),
                      transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                    ),
                  );
                },
                child: const CustomBasicContainer(
                    width: 347,
                    height: 60,
                    color: Color(0xFF4B433E),
                    circularBorderRadius: 60,
                    child: Text(
                      '다음',
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
        )
      ),
    );
  }
}
