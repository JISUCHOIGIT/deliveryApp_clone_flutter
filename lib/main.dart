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
      /**디버그 모드 삭제*/
      // 로그인 : accessToken, refreshToken 사용
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(),
      ),
    );
  }
}
