import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:potenday/src/config/global_variables.dart';
import 'package:potenday/src/provider/user_mode_provider.dart';
import 'package:potenday/src/util/custom_basic_container.dart';
import 'package:potenday/src/view/component/take_walk/detail_take_walk.dart';
import 'package:potenday/src/view/header/app_header.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:transition/transition.dart';

class DayTakeWalk extends StatefulWidget {
  const DayTakeWalk({super.key});

  @override
  State<DayTakeWalk> createState() => _DayTakeWalkState();
}

class _DayTakeWalkState extends State<DayTakeWalk> {
  late UserModeProvider userModeProvider;

  final double deviceWidth = GlobalVariables.width;
  final double deviceHeight = GlobalVariables.height;

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  String _startTime = '시작';
  String _endTime = '종료';

  @override
  void initState() {
    super.initState();
  }

  List<String> startTimeSlots() {
    List<String> timeSlots = [];
    DateTime now = DateTime.now();

    DateTime startTime = now.minute < 30
        ? DateTime(now.year, now.month, now.day, now.hour, 30).add(const Duration(minutes: 30))
        : DateTime(now.year, now.month, now.day, now.hour + 1, 0).add(const Duration(minutes: 30));
    DateTime endTime = DateTime(now.year, now.month, now.day, 23, 00);

    while (startTime.isBefore(endTime) || startTime.isAtSameMomentAs(endTime)) {
      String formattedTime = '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}';
      timeSlots.add(formattedTime);
      startTime = startTime.add(const Duration(minutes: 30));
    }

    return timeSlots;
  }

  List<String> endTimeSlots() {
    List<String> timeSlots = [];
    DateTime now = DateTime.now();
    DateTime startTime;
    DateTime endTime;

    if (_startTime != '시작') {
      List<String> timeParts = _startTime.split(':');
      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);

      startTime = DateTime(now.year, now.month, now.day, hour, minute).add(const Duration(minutes: 30));
      endTime = DateTime(now.year, now.month, now.day, 24, 00);
    } else {
      startTime = now.minute < 30
          ? DateTime(now.year, now.month, now.day, now.hour, 30).add(const Duration(hours: 1))
          : DateTime(now.year, now.month, now.day, now.hour + 1, 0).add(const Duration(hours: 1));
      endTime = DateTime(now.year, now.month, now.day, 24, 00);
    }

    while (startTime.isBefore(endTime) || startTime.isAtSameMomentAs(endTime)) {
      String formattedTime = '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}';
      timeSlots.add(formattedTime);
      startTime = startTime.add(const Duration(minutes: 30));
    }

    return timeSlots;
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
        appBar: AppHeader(isCancel: true, isAlarm:  true,),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 28, 14, 134),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '산책 일정을 \n선택해주세요',
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
                          '산책 날짜',
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
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 24, 10, 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF4C433F),
                      width: 2.0,
                    ),
                  ),
                  child: Stack(
                    children: [
                      TableCalendar(
                        focusedDay: _focusedDay,
                        firstDay: DateTime(_focusedDay.year, _focusedDay.month),
                        lastDay: DateTime(_focusedDay.year, _focusedDay.month + 3),
                        availableGestures: AvailableGestures.none,
                        daysOfWeekHeight: 20,
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          leftChevronVisible: false,
                          rightChevronVisible: false,
                          titleCentered: false,
                          headerPadding: EdgeInsets.only(left: 30, bottom: 14),
                          titleTextFormatter: (DateTime date, dynamic locale) {
                            return '${date.year}년 ${date.month}월';
                          },
                          titleTextStyle: const TextStyle(
                            color: Color(0xFF212121),
                            fontSize: 13.11,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        calendarStyle: const CalendarStyle(
                          isTodayHighlighted: false,
                        ),
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                            color: Color(0xFF212121),
                            fontSize: 13.11,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w600,
                          ),
                          weekendStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 13.11,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // selectedDayPredicate: (day) {
                        //   return isSameDay(_selectedDay, day);
                        // },
                        calendarBuilders: CalendarBuilders(
                          // 요일 텍스트 스타일을 설정하는 부분
                          dowBuilder: (context, day) {
                            final text = ['월', '화', '수', '목', '금', '토', '일'][day.weekday - 1];
                            final style = TextStyle(
                              color: day.weekday == DateTime.saturday
                                  ? Colors.blue
                                  : day.weekday == DateTime.sunday
                                  ? Colors.red
                                  : Colors.black,
                              fontSize: 13.11,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w600,
                            );
                            return Center(
                              child: Text(text, style: style),
                            );
                          },
                          // 날짜 텍스트 스타일을 설정하는 부분
                          defaultBuilder: (context, date, _) {
                            if (date.isBefore(DateTime.now())) {
                              // 이전 날짜인 경우 선택할 수 없도록 비활성화 처리합니다.
                              return Center(
                                child: Text(
                                  '${date.day}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13.11,
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              );
                            } else {
                              // 이후 날짜인 경우 선택 가능하도록 처리합니다.
                              if (date.month == _focusedDay.month) {
                                if (date.weekday == DateTime.saturday) {
                                  return Center(
                                    child: Text(
                                      '${date.day}',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 13.11,
                                          fontFamily: 'NotoSansKR',
                                          fontWeight: FontWeight.w700,
                                        ),
                                    ),
                                  );
                                } else if (date.weekday == DateTime.sunday) {
                                  return Center(
                                    child: Text(
                                      '${date.day}',
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 13.11,
                                        fontFamily: 'NotoSansKR',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  );
                                }
                                return Center(
                                  child: Text(
                                    '${date.day}',
                                    style: const TextStyle(
                                      color: Color(0xFF4C433F),
                                      fontSize: 13.11,
                                      fontFamily: 'NotoSansKR',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                );
                              } else {
                                // 다음 달 또는 이전 달의 날짜에 대한 처리는 이전과 동일하게 유지합니다.
                                return Center(
                                  child: Text(
                                    '${date.day}',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                );
                              }
                            }
                          },
                          // 선택된 날짜에 대한 동그라미 표시를 설정합니다.
                          selectedBuilder: (context, date, _) {
                            if (date.isBefore(DateTime.now())) {
                              return Center(
                                child: Container(
                                  width: 39.33,
                                  height: 39.33,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent, // 투명한 색상으로 설정하여 마커를 숨깁니다.
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${date.day}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13.11,
                                        fontFamily: 'NotoSansKR',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Center(
                                child: Container(
                                  width: 39.33,
                                  height: 39.33,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFE9E4DE),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${date.day}',
                                      style: const TextStyle(
                                        color: Color(0xFF4C433F),
                                        fontSize: 13.11,
                                        fontFamily: 'NotoSansKR',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        },
                      ),
                      Positioned(
                        right: 0,
                        top: -15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.chevron_left, size: 30),
                              onPressed: () {
                                // 왼쪽 화살표 클릭 시 동작
                                setState(() {
                                  if (_focusedDay.month == DateTime.now().month && _focusedDay.year == DateTime.now().year) {
                                    _focusedDay = DateTime.now();
                                  } else {
                                    _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1);
                                  }
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.chevron_right, size: 30),
                              onPressed: () {
                                // 오른쪽 화살표 클릭 시 동작
                                setState(() {
                                  if (_focusedDay.month < DateTime.now().month + 3 && _focusedDay.year <= DateTime.now().year) {
                                    _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
                                  } else if (_focusedDay.year > DateTime.now().year && _focusedDay.month < 2 - (12 - DateTime.now().month)) {
                                    _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
                                  } else {
                                    _focusedDay = _focusedDay;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 38),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: Text(
                      '산책 시간',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomBasicContainer(
                      width: 150,
                      height: 53,
                      color: Colors.white,
                      circularBorderRadius: 10,
                      border: Border.all(color: const Color(0xFF4C433F), width: 1),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 19, right: 8),
                            child: Row(
                              children: [
                                Text(
                                  _startTime,
                                  style: const TextStyle(
                                    color: Color(0xFF1F1F1F),
                                    fontSize: 12,
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 40),
                                PopupMenuButton<String>(
                                  color: Colors.white,
                                  icon: const Icon(Icons.keyboard_arrow_down_sharp, size: 25),
                                  offset: Offset(-64, 0),
                                  onSelected: (String value) {
                                    setState(() {
                                      _startTime = value;
                                    });
                                  },
                                  itemBuilder: (BuildContext context) {
                                    if (startTimeSlots().length >= 4) {
                                      return [
                                        PopupMenuItem<String>(
                                          child: SizedBox(
                                            height: 180,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: startTimeSlots().map((String choice) {
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
                                                        _startTime = choice;
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ];
                                    } else {
                                      return startTimeSlots().map((String choice) {
                                        return PopupMenuItem<String>(
                                          child: ListTile(
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
                                                _startTime = choice;
                                                Navigator.pop(context);
                                              });
                                            },
                                          ),
                                        );
                                      }).toList();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 47,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '~',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    CustomBasicContainer(
                      width: 150,
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
                                  _endTime,
                                  style: const TextStyle(
                                    color: Color(0xFF1F1F1F),
                                    fontSize: 12,
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 40),
                                PopupMenuButton<String>(
                                  color: Colors.white,

                                  icon: const Icon(Icons.keyboard_arrow_down_sharp, size: 25),
                                  onSelected: (String value) {
                                    setState(() {
                                      _endTime = value;
                                    });
                                  },
                                  itemBuilder: (BuildContext context) {
                                    if (endTimeSlots().length >= 4) {
                                      return [
                                        PopupMenuItem<String>(
                                          child: SizedBox(
                                            height: 180,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: endTimeSlots().map((String choice) {
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
                                                        _endTime = choice;
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ];
                                    } else {
                                      return endTimeSlots().map((String choice) {
                                        return PopupMenuItem<String>(
                                          child: ListTile(
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
                                                _endTime = choice;
                                                Navigator.pop(context);
                                              });
                                            },
                                          ),
                                        );
                                      }).toList();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 51),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      Transition(
                        child: DetailTakeWalk(),
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
          ),
        ),
      ),
    );
  }
}
