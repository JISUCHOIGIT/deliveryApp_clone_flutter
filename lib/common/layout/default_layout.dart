import 'package:flutter/material.dart';

// 모든 view에 일괄 적용하고 싶은 api나 기능을 넣고 싶을 때,
// defaultLayout에 넣기만 하면 defaultLayout 설정되어 있는 screen 모두에 적용이 가능
class DefaultLayout extends StatelessWidget {
  // 위젯을 받는 요소
  final Widget child;
  // background color
  final Color? backgroundColor;

  const DefaultLayout({
    required this.child,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundcolor를 받지 않은 경우 null이면 Colors.white
      backgroundColor: backgroundColor ?? Colors.white,
      body: child,
    );
  }
}
