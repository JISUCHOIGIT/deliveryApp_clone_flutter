import 'package:delivery_app_clone_flutter/common/const/colors.dart';
import 'package:delivery_app_clone_flutter/common/const/data.dart';
import 'package:delivery_app_clone_flutter/common/layout/default_layout.dart';
import 'package:delivery_app_clone_flutter/common/view/root_tab.dart';
import 'package:delivery_app_clone_flutter/user/view/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// 어느페이지로 이동할지 판단하는 페이지
// 앱이 처음 실행 됐을 경우만 실행될 때 토큰이 있는지 없는지 확인만 하면 됨
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // initState 안에서 await 사용 금지
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //deleteToken();
    checkToken();
  }

  // token 삭제
  void deleteToken() async {
    await storage.deleteAll();
  }

  // accessToken, refreshToken 갖고있는지 확인하는 함수
  void checkToken() async {
    // 저장되어 있는 refreshToken, accessToken 읽어오기
    // 하루가 지나면 유효기일이 있지 않기에 사용하지 못하기에
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final dio = Dio();

    // 현재는 splash에서만 Token 유무를 확인 하지만, 앱이 종료 되고서 하루 지났을 경우 Token 확인 해야 하는 로직이 필요
    try {
      // 유효기일이 지났을 경우 refreshToken 재발급 요청
      final resp = await dio.post(
        'http://$ip/auth/token',
        options: Options(
          headers: {
            'authorization': 'Bearer $refreshToken',
          },
        ),
      );
      // 재발급된 refreshToken으로 accessToken값을 재발급 받을 시 storage 저장하여 갱신해주기
      await storage.write(key: ACCESS_TOKEN_KEY, value: resp.data['accessToken']);
      // 재발급이 된 경우 rootTab 이동
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => RootTab()), (route) => false);
    } catch (e) {
      // 에러가 난 경우 LoginScreen으로 이동
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false);
    }
  }

  /**
   *  refreshTokne, accessToken 2개 중 1개라도 없다면 LoginScreen으로 이동
      if(refreshToken == null || accessToken == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
      } else {
      // refreshTokne, accessToken 2개 중 1개라도 없다면 RootTabScreen 이동
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => RootTab()), (route) => false);
      }
      }
   * */

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        backgroundColor: PRIMARY_COLOR,
        child: SizedBox(
          // 넓이 최대한으로 하여 가운데 정렬
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/img/logo/logo.png',
                width: MediaQuery.of(context).size.width / 2,
              ),
              const SizedBox(height: 16.0),
              CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}
