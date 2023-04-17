import 'package:delivery_app_clone_flutter/common/const/colors.dart';
import 'package:delivery_app_clone_flutter/common/const/data.dart';
import 'package:delivery_app_clone_flutter/common/layout/default_layout.dart';
import 'package:delivery_app_clone_flutter/common/view/root_tab.dart';
import 'package:delivery_app_clone_flutter/user/view/login_screen.dart';
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
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    // refreshTokne, accessToken 2개 중 1개라도 없다면 LoginScreen으로 이동
    if(refreshToken == null || accessToken == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
    } else {
      // refreshTokne, accessToken 2개 중 1개라도 없다면 RootTabScreen 이동
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => RootTab()), (route) => false);
    }
  }

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
