import 'package:bluespace/models/user_info.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MineState implements Cloneable<MineState> {
  GlobalKey<ScaffoldState> scafoldState =
      GlobalKey<ScaffoldState>(debugLabel: 'mineScafold');
  String name;
  String avatar;
  bool isLogin;
  AnimationController animationController;
  @override
  UserInfo userInfo;
  @override
  MineState clone() {
    return MineState()
      ..name = name
      ..avatar = avatar
      ..isLogin = isLogin
      ..themeColor = themeColor
      ..animationController = animationController
      ..scafoldState = scafoldState
      ..userInfo = userInfo;
  }

  @override
  Color themeColor;
}

MineState initState(Map<String, dynamic> args) {
  return MineState()..name = '';
}
