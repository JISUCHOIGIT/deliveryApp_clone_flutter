import 'package:delivery_app_clone_flutter/common/const/colors.dart';
import 'package:delivery_app_clone_flutter/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with TickerProviderStateMixin {
  // late : 나중에 값을 부를때 controller 선언이 되어 있을 거라는 명시
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // vsync : 현재 state 해당하는 걸 넣어줘야 함
    // with TickerProviderStateMixin 넣어줘야 함
    // 애니메이션 관련 컨트롤러는 이렇게 설정하는 음우가 많음
    // controller는 가장먼저 선언해야함
    controller = TabController(length: 4, vsync: this);

    // tabBarView index이동 하기 위한 addListener 함수
    // tabListener 통해서
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.removeListener(tabListener);
  }

  // tabListener 안에서 index setState해주기
  // 현재 index -> controller.index 넣어주기
  void tabListener(){
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩딜리버리',
      // TabBar 해당 View
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          Center(
            child: Container(
              child: Text('홈'),
            ),
          ),
          Center(
            child: Container(
              child: Text('음식'),
            ),
          ),
          Center(
            child: Container(
              child: Text('주문'),
            ),
          ),
          Center(
            child: Container(
              child: Text('프로필'),
            ),
          ),
        ],
      ),
      // bottomNavigationBar 속성
      bottomNavigationBar: BottomNavigationBar(
        // 선택된 아이템 색상
        selectedItemColor: PRIMARY_COLOR,
        // 선택되지 않은 아이템 색상
        unselectedItemColor: BODY_TEXT_COLOR,
        // 선택된 폰트 사이즈
        selectedFontSize: 10,
        // 선택되지 않은 폰트 사이즈
        unselectedFontSize: 10,
        // 선택될 때 애니메이션
        type: BottomNavigationBarType.fixed,
        // 탭을 클릭한 index 숫자
        onTap: (int index){
          // 클릭한 index 현재 index에 대입하여 바꿔주기 + setState
            controller.animateTo(index);
        },
        // 현재 index 정보
        currentIndex: index,
        // BottomNavigationBarItem으로 tab 항목 나뉠 수 있음
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '홈'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_outlined),
            label: '음식'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
            label: '주문'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: '프로필'
          ),
        ],
      ),
    );
  }
}
