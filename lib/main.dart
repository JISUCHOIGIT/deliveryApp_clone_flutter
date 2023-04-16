import 'package:delivery_app_clone_flutter/common/component/custom_text_formfield.dart';
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
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ios 키보드 : command + shift + k
            CustomTextFormField(
              hintText: '이메일을 입력해주세요',
              onChanged: (value) {},
            ),
            CustomTextFormField(
              hintText: '비밀번호를 입력해주세요',
              onChanged: (value) {},
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
