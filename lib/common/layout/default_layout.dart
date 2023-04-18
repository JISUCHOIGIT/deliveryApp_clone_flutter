import 'package:flutter/material.dart';

// 모든 view에 일괄 적용하고 싶은 api나 기능을 넣고 싶을 때,
// defaultLayout에 넣기만 하면 defaultLayout 설정되어 있는 screen 모두에 적용이 가능
class DefaultLayout extends StatelessWidget {
  // 위젯을 받는 요소
  final Widget child;
  // background color
  final Color? backgroundColor;
  // appBar title
  final String? title;
  final Widget? bottomNavigationBar;

  const DefaultLayout({
    required this.child,
    this.backgroundColor,
    this.title,
    this.bottomNavigationBar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor 받지 않아 null 일 경우 Colors.white
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: renderAppBar(),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  // return null 위해서 AppBar?
  AppBar? renderAppBar() {
    // title == null 처리
    if (title == null) {
      return null;
    } else {
      return AppBar(
        elevation: 0,
        title: Text(
          title!,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      );
    }
  }
}
