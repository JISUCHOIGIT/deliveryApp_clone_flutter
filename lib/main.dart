import 'package:delivery_app_clone_flutter/common/component/custom_text_formfield.dart';
import 'package:delivery_app_clone_flutter/common/view/splash_screen.dart';
import 'package:delivery_app_clone_flutter/user/view/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    _App(),
  );
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**runApp에 바로 _App을 넣어서
    MaterialApp으로 감싸기*/
    return MaterialApp(
      // 전체 지정하고 싶은 font 적용
      theme: ThemeData(
        fontFamily: 'Notosans',
      ),
      /**디버그 모드 삭제*/
      // 로그인 : accessToken, refreshToken 사용
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        // 로그인 화면
        body: SplashScreen(),
      ),
    );
  }
}
