import 'package:flutter/material.dart';
import 'package:potenday/src/config/global_variables.dart';
import 'package:potenday/src/provider/bottom_navigation_bar_provider.dart';
import 'package:potenday/src/view/body/chat_body.dart';
import 'package:potenday/src/view/body/history_body.dart';
import 'package:potenday/src/view/body/home_body.dart';
import 'package:potenday/src/view/body/mate_body.dart';
import 'package:potenday/src/view/body/profile_body.dart';
import 'package:potenday/src/view/component/bottom_navigation.dart';
import 'package:provider/provider.dart';

class MainTemplate extends StatefulWidget {
  const MainTemplate({super.key});

  @override
  State<MainTemplate> createState() => _MainTemplateState();
}

class _MainTemplateState extends State<MainTemplate> {
  late BottomNavigationBarProvider bottomNavigationBarProvider;

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
    debugPrint('MYLOG build MainTemplate');
    bottomNavigationBarProvider = Provider.of<BottomNavigationBarProvider>(context);
    GlobalVariables.width = MediaQuery.of(context).size.width;
    GlobalVariables.height = MediaQuery.of(context).size.height;

    return PopScope(
      canPop: true,
      child: Scaffold(
        body: <int, Widget>{
          0: const HomeBody(),
          1: const MateBody(),
          2: const HistoryBody(),
          3: const ProfileBody(),
          4: const ChatBody(),
        }[bottomNavigationBarProvider.currentIndex]!,
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}
