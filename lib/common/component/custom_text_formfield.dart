import 'package:delivery_app_clone_flutter/common/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  /** 공통으로 여러 곳에서 사용하는 경우 외부에서 받는 파라미터 지정 */
  final String? hintText;
  final String? errorText;

  // 정의로 가서 타입이 뭔지 보고 그대로 넣기
  final bool obscureText;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;

  // boolean 값의 파라미터는 false, true 등을 기본값으로 넣어주기
  const CustomTextFormField(
      {this.hintText,
      this.errorText,
      this.obscureText = false,
      this.autoFocus = false,
      this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 테두리가 있으며 입력하는 border
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0,
      ),
    );

    // TextFormField : 텍스트 입력값
    return TextFormField(
      // 커서 color
      cursorColor: PRIMARY_COLOR,
      // 비밀번호 입력할 때 텍스트 암호화
      obscureText: obscureText,
      // 화면에 들어왔을 시 커서를 지정하여 focus를 자동으로 할지 지정
      autofocus: autoFocus,
      // 값이 바뀔 때마다 실행되는 콜백
      onChanged: onChanged,
      // textfield 안의 디자인 = inputDecoration + padding도 사용 가능
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        hintText: hintText,
        errorText: errorText,
        // hint style
        hintStyle: TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0,
        ),
        // textfield background Color
        fillColor: INPUT_BG_COLOR,
        // fillColor ture = 배경색 있음
        // fillColor false = 배경색 없음
        filled: true,
        // 모든 Input 상태의 기본 스타일 세팅
        border: baseBorder,
        // enableBorder : 기본 값이 검정색 테두리로 설정 되어 있음
        // enableBorder : 활성화가 되어 있지 않는 경우의 border styleeeee
        enabledBorder: baseBorder,
        // 포커스 할때 색상 지정
        focusedBorder: baseBorder.copyWith(
          // borderSide 변경 시 baseBoder 지정된 borderSide 변경
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}
