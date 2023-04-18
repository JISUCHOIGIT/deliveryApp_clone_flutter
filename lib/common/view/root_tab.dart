import 'package:delivery_app_clone_flutter/common/const/colors.dart';
import 'package:delivery_app_clone_flutter/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩딜리버리',
      child: Center(
        child: Text('Root Tab'),
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
          setState(() {
            this.index = index;
          });
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
