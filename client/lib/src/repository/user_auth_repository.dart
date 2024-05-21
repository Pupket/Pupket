import 'dart:convert';

import 'package:http/http.dart';
import 'package:potenday/src/interface/api_callable.dart';

class UserAuthRepository extends APICallable {
  Future<Response> emailSignUp() async {
    return await post(
      Uri.http(domain, 'api/v1/account/sign-up'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "name": "장영훈",
        "nickname": "장영훈",
        "address": "테스트",
        "profileImage": "테스트",
        "contact": "01012345678",
        "gender": "female",
        "password": "string12!@",
        "email": "gnsdudwkd@naver.com"
      }),
    );
  }
}