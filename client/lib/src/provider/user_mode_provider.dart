import 'package:flutter/material.dart';
import 'package:potenday/src/config/color_set.dart';

class UserModeProvider with ChangeNotifier {
  // 1: 메인 화면 보호자, 2: 메인 화면 메이트, 3: 위젯 화면 보호자, 4: 위젯 화면 메이트
  int _isGuardian = 1;
  Color _backgroundColor = CustomColor.lightBackgroundColor;

  int get isGuardian => _isGuardian;
  Color get backgroundColor => _backgroundColor;

  set isGuardian(int value) {
    _isGuardian = value;

    switch (_isGuardian) {
      case 1:
        _backgroundColor = CustomColor.lightBackgroundColor;
        break;
      case 2:
        _backgroundColor = CustomColor.darkBackgroundColor;
        break;
      case 3:
        _backgroundColor = CustomColor.lightBackgroundColor;
        break;
      case 4:
        _backgroundColor = CustomColor.darkBackgroundColor;
        break;
      default:
        _backgroundColor = CustomColor.lightBackgroundColor;
        break;
    }

    notifyListeners();
  }
}
