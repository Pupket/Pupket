import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:potenday/src/config/color_set.dart';
import 'package:potenday/src/config/global_variables.dart';
import 'package:potenday/src/provider/user_mode_provider.dart';
import 'package:potenday/src/repository/user_auth_repository.dart';
import 'package:potenday/src/view/component/take_walk/title_take_walk.dart';
import 'package:provider/provider.dart';
import 'package:transition/transition.dart';

class TakeWalkBody extends StatefulWidget {
  const TakeWalkBody({super.key});

  @override
  State<TakeWalkBody> createState() => _TakeWalkBodyState();
}

class _TakeWalkBodyState extends State<TakeWalkBody> {
  final double deviceWidth = GlobalVariables.width;
  final double deviceHeight = GlobalVariables.height;
  late UserModeProvider userModeProvider;

  List<String> imageUrls = [
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMDRfNTUg%2FMDAxNzA0MzM0Njg0NjEz.rbvyicVGHsxWovvEz62x14-0DwoQq3hNPzVomLe18M0g.BWJGdo7HENTSynAkCvB7WvD3lM7NGJSh6jLT6Y-_UN0g.PNG.oneflora%2F00014-1223653379.png&type=sc960_832', // 예시 이미지 URL 1
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA0MTNfNzEg%2FMDAxNzEzMDEwMjY0NDg4.EjPBACmGd9-DIuF0eg0eJDayrdxNK4WGdgria81r1Cog.OYmrq4brd4okxihvDuiTz0YUxLi_FYK7rs81Q58G4qMg.PNG%2Fthe-cat-is-playing-with-a-tiny-bug-shaped-toy.png&type=sc960_832', // 예시 이미지 URL 2
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMTNfMjQw%2FMDAxNzA1MTA0MDYwMDg4.54mPACbN33kKHW8gEhiLzapxtKjiGyg_QpqzXXmR6YUg.6z9aQ0XUhfDc3hF4NdJp_QhhpTmxb8DraD4ajKGXw5Ig.PNG.merry_diary%2F%25B0%25ED%25BE%25E7%25C0%25CC%25C0%25CC%25C0%25AF%25BD%25C4_%25282%2529.png&type=sc960_832', // 예시 이미지 URL 3
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA0MDRfMjkg%2FMDAxNzEyMjIzMDAzOTM0.n_XSoK5fgBLLeMd0GNNmsDrX-OpcB94ockLUDQZ3vlAg.FVubktGRgG1sX6XpyWg9Lq3bba8z6R-0c52ACkVQisMg.JPEG%2F20170222%25A3%25DF210544.jpg&type=sc960_832', // 예시 이미지 URL 4
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMDRfNTUg%2FMDAxNzA0MzM0Njg0NjEz.rbvyicVGHsxWovvEz62x14-0DwoQq3hNPzVomLe18M0g.BWJGdo7HENTSynAkCvB7WvD3lM7NGJSh6jLT6Y-_UN0g.PNG.oneflora%2F00014-1223653379.png&type=sc960_832', // 예시 이미지 URL 1
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA0MTNfNzEg%2FMDAxNzEzMDEwMjY0NDg4.EjPBACmGd9-DIuF0eg0eJDayrdxNK4WGdgria81r1Cog.OYmrq4brd4okxihvDuiTz0YUxLi_FYK7rs81Q58G4qMg.PNG%2Fthe-cat-is-playing-with-a-tiny-bug-shaped-toy.png&type=sc960_832', // 예시 이미지 URL 2
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMTNfMjQw%2FMDAxNzA1MTA0MDYwMDg4.54mPACbN33kKHW8gEhiLzapxtKjiGyg_QpqzXXmR6YUg.6z9aQ0XUhfDc3hF4NdJp_QhhpTmxb8DraD4ajKGXw5Ig.PNG.merry_diary%2F%25B0%25ED%25BE%25E7%25C0%25CC%25C0%25CC%25C0%25AF%25BD%25C4_%25282%2529.png&type=sc960_832', // 예시 이미지 URL 3
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA0MDRfMjkg%2FMDAxNzEyMjIzMDAzOTM0.n_XSoK5fgBLLeMd0GNNmsDrX-OpcB94ockLUDQZ3vlAg.FVubktGRgG1sX6XpyWg9Lq3bba8z6R-0c52ACkVQisMg.JPEG%2F20170222%25A3%25DF210544.jpg&type=sc960_832', // 예시 이미지 URL 4
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMDRfNTUg%2FMDAxNzA0MzM0Njg0NjEz.rbvyicVGHsxWovvEz62x14-0DwoQq3hNPzVomLe18M0g.BWJGdo7HENTSynAkCvB7WvD3lM7NGJSh6jLT6Y-_UN0g.PNG.oneflora%2F00014-1223653379.png&type=sc960_832', // 예시 이미지 URL 1
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA0MTNfNzEg%2FMDAxNzEzMDEwMjY0NDg4.EjPBACmGd9-DIuF0eg0eJDayrdxNK4WGdgria81r1Cog.OYmrq4brd4okxihvDuiTz0YUxLi_FYK7rs81Q58G4qMg.PNG%2Fthe-cat-is-playing-with-a-tiny-bug-shaped-toy.png&type=sc960_832', // 예시 이미지 URL 2
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMTNfMjQw%2FMDAxNzA1MTA0MDYwMDg4.54mPACbN33kKHW8gEhiLzapxtKjiGyg_QpqzXXmR6YUg.6z9aQ0XUhfDc3hF4NdJp_QhhpTmxb8DraD4ajKGXw5Ig.PNG.merry_diary%2F%25B0%25ED%25BE%25E7%25C0%25CC%25C0%25CC%25C0%25AF%25BD%25C4_%25282%2529.png&type=sc960_832', // 예시 이미지 URL 3
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA0MDRfMjkg%2FMDAxNzEyMjIzMDAzOTM0.n_XSoK5fgBLLeMd0GNNmsDrX-OpcB94ockLUDQZ3vlAg.FVubktGRgG1sX6XpyWg9Lq3bba8z6R-0c52ACkVQisMg.JPEG%2F20170222%25A3%25DF210544.jpg&type=sc960_832', // 예시 이미지 URL 4
    // 필요한 만큼 이미지 URL 추가
  ];
  List<String> nicknames = [
    'Nickname 1', // 예시 닉네임 1
    'Nickname 2', // 예시 닉네임 2
    'Nickname 3', // 예시 닉네임 3
    'Nickname 4', // 예시 닉네임 4
    'Nickname 1', // 예시 닉네임 1
    'Nickname 2', // 예시 닉네임 2
    'Nickname 3', // 예시 닉네임 3
    'Nickname 4', // 예시 닉네임 4
    'Nickname 1', // 예시 닉네임 1
    'Nickname 2', // 예시 닉네임 2
    'Nickname 3', // 예시 닉네임 3
    'Nickname 4', // 예시 닉네임 4
    // 필요한 만큼 닉네임 추가
  ];

  Widget changeMode() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: InkWell(
          onTap: () {
            setState(() {
              userModeProvider.isGuardian = userModeProvider.isGuardian % 2 == 1 ? 2 : 1;
            });
          },
          child: Container(
            width: userModeProvider.isGuardian % 2 == 1 ? 134 : 151,
            height: 36,
            padding: EdgeInsets.fromLTRB(13, 2, 13, 3),
            decoration: ShapeDecoration(
              color: Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userModeProvider.isGuardian % 2 == 1 ? '보호자 모드' : '산책메이트 모드',
                        style: TextStyle(
                          color: Color(0xFF4C433F),
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w700,
                          height: 1.2, // 기본 줄 간격을 설정합니다.
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userModeProvider.isGuardian % 2 == 1 ? '산책메이트 모드' : '보호자 모드',
                        style: TextStyle(
                          color: Color(0xFF4C433F),
                          fontSize: 10,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          height: 1.2, // 기본 줄 간격을 설정합니다.
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 7),
                Image.asset('assets/images/change_arrow.png', width: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget findGuardianCard() {
    return Flexible(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 그리드 열의 개수
          crossAxisSpacing: 11, // 열 사이의 간격
          mainAxisSpacing: 15, // 행 사이의 간격
        ),
        itemCount: imageUrls.length, // 그리드 아이템의 개수는 이미지 URL의 개수와 같음
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30), // 원하는 곡선의 반지름 설정
              child: Image.network(imageUrls[index], fit: BoxFit.cover),
            ),
            footer: GridTileBar(
              // backgroundColor: Colors.black45,
              title: Text(
                nicknames[index], // 해당 인덱스의 닉네임을 표시
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }


  Widget findMateCard() {
    return SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('MYLOG build TakeWalkBody');
    userModeProvider = Provider.of<UserModeProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: userModeProvider.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(17, 21, 17, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            changeMode(),
            SizedBox(height: 43),
            findGuardianCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userModeProvider.isGuardian = 3;
          Navigator.push(
              context,
              Transition(
                child: WriteTakeWalk(),
                transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
              ),
          );
        },
        child: Image.asset('assets/images/writing_image.png', width: 35),
        backgroundColor: Color(0xFFD9D9D9),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}