import 'package:delivery_app_clone_flutter/common/const/colors.dart';
import 'package:delivery_app_clone_flutter/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

import '../../common/component/custom_text_formfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        // 키보드가 올라올 시 overflow가 될 수가 있으므로 overflow가 되는 제일 윗 위젯 상단에 singleChildScrollView로 만들기
        child: SingleChildScrollView(
      //  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag  = 드래그 할 시 키보드 내려감
      //  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual = 키보드 done을 해야 키보드 내려감
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _Title(),
              const SizedBox(height: 16.0),
              const _SubTitle(),
              Image.asset(
                'asset/img/misc/logo.png',
                width: MediaQuery.of(context).size.width / 3 * 2,
              ),
              // ios 키보드 : command + shift + k
              CustomTextFormField(
                hintText: '이메일을 입력해주세요',
                onChanged: (value) {},
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                hintText: '비밀번호를 입력해주세요',
                onChanged: (value) {},
                obscureText: true,
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () {},
                // ElevatedButton style
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR,
                ),
                child: const Text('로그인'),
              ),
              TextButton(
                onPressed: () {},
                // TextButton Style
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                child: const Text('회원가입'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '환영합니다!',
      style: TextStyle(
          fontSize: 34, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '이메일과 비밀번호를 입력해서 로그인 해주세요!\n오늘도 성공적인 주문이 되길 :)',
      style: TextStyle(fontSize: 15, color: BODY_TEXT_COLOR),
    );
  }
}
