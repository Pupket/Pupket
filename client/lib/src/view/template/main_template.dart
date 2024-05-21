import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:potenday/src/config/color_set.dart';
import 'package:potenday/src/config/global_variables.dart';
import 'package:potenday/src/provider/bottom_navigation_bar_provider.dart';
import 'package:potenday/src/view/body/my_page_body.dart';
import 'package:potenday/src/view/body/my_walk_body.dart';
import 'package:potenday/src/view/body/home_body.dart';
import 'package:potenday/src/view/body/take_walk_body.dart';
import 'package:potenday/src/view/body/profile_body.dart';
import 'package:potenday/src/view/component/bottom_navigation.dart';
import 'package:potenday/src/view/header/app_header.dart';
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

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: CustomColor.backgroundColor,
      ),
      child: PopScope(
        canPop: true,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Scaffold(
            // appBar: const AppHeader(),
            body: <int, Widget>{
              0: const HomeBody(),//SafeArea(top: true, bottom: false, child: HomeBody()),
              1: const TakeWalkBody(),
              2: const MyWalkBody(),
              3: const ProfileBody(),
              4: const MyPageBody(),
            }[bottomNavigationBarProvider.currentIndex]!,
            bottomNavigationBar: BottomNavigation(),
          ),
        ),
      ),
    );
  }
}
