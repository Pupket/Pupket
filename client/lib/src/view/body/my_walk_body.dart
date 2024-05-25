import 'package:flutter/material.dart';
import 'package:potenday/src/repository/user_auth_repository.dart';

class MyWalkBody extends StatefulWidget {
  const MyWalkBody({super.key});

  @override
  State<MyWalkBody> createState() => _MyWalkBodyState();
}

class _MyWalkBodyState extends State<MyWalkBody> {
  @override
  Widget build(BuildContext context) {
    debugPrint('MYLOG build MyWalkBody');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('API Test')),
        body: Center(
          child: APIRequestButton(),
        ),
      ),
    );
  }
}

class APIRequestButton extends StatelessWidget {
  final UserAuthRepository userAuthRepository = UserAuthRepository();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // API 요청 보내기
        await userAuthRepository.emailSignUp2().then((response) {
          // 응답 결과를 다이얼로그로 보여주기
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Response'),
                content: Text('Status: ${response.statusCode}\nBody: ${response.body}'),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        });
      },
      child: Text('Send API Request'),
    );
  }
}