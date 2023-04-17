import 'dart:convert';
import 'dart:io';

import 'package:delivery_app_clone_flutter/common/const/colors.dart';
import 'package:delivery_app_clone_flutter/common/layout/default_layout.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../common/component/custom_text_formfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // auth/login API, auth/token API

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    /**localhost*/
    // 안드로이드 에뮬레이터는 ip가 좀 다름
    final emulatorIp = '10.0.2.2:3000';
    // 아이폰 시뮬레이터는 현재 내 컴퓨터 네트워크와 같음
    final simulatorIp = '127.0.0.1:3000';

    final ip = Platform.isIOS ? simulatorIp : emulatorIp;

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
                  onPressed: () async {
                    // ID:비밀번호 -> Base64로 변환해야 함
                    final rawString = 'test@codefactory.ai:testtest';

                    // Codec : convert / 일반 스트링 base64로 변환
                    // 어떻게 변환할건지
                    Codec<String, String> stringToBase64 = utf8.fuse(base64);

                    // rawString 값을 변환한 token으로 저장
                    String token = stringToBase64.encode(rawString);

                    // dio post, get ...
                    final resp = await dio.post(
                      'http://$ip/auth/login',
                      options: Options(
                        headers: {
                          'authorization': 'Basic $token',
                        },
                      ),
                    );
                    print(resp.data);
                  },
                  // ElevatedButton style
                  style: ElevatedButton.styleFrom(
                    primary: PRIMARY_COLOR,
                  ),
                  child: const Text('로그인'),
                ),
                TextButton(
                  onPressed: () async {
                    final refreshToken =
                        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3RAY29kZWZhY3RvcnkuYWkiLCJzdWIiOiJmNTViMzJkMi00ZDY4LTRjMWUtYTNjYS1kYTlkN2QwZDkyZTUiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY4MTczNjE4MywiZXhwIjoxNjgxODIyNTgzfQ.ygZrzTlUst6IgKAW7MnxoM2xaOX7nIz2jDQgKi71iO4';

                    final resp = await dio.post(
                      'http://$ip/auth/token',
                      options: Options(
                        headers: {
                          'authorization': 'Bearer $refreshToken',
                        },
                      ),
                    );
                    print(resp.data);
                  },
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
      ),
    );
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
