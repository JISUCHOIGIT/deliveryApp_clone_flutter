import 'package:delivery_app_clone_flutter/common/const/colors.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  // 외부에서 받을 파라미터
  // 이미지
  final Widget image;
  // 레스토랑 이름
  final String name;
  // 레스토랑 태그
  final List<String> tags;
  // 평점 갯수
  final int ratingCount;
  // 배송 걸리는 시간
  final int deliveryTime;
  // 배송 비용
  final int deliveryFee;
  // 평균 평점
  final double rating;

  const RestaurantCard({
    required this.image,
    required this.name,
    required this.tags,
    required this.ratingCount,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.rating,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 이미지
        // 이미지 자체를 깍아서 만듬
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: image,
        ),
        const SizedBox(height: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 8.0),
            // 리스트 텍스트 합칠 때 다른 문자랑 합치고 싶을 때 사용
            Text(
              tags.join(' · '),
              style: TextStyle(
                color: BODY_TEXT_COLOR,
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                _IconText(icon: Icons.star, label: rating.toString()),
                renderDot(),
                _IconText(icon: Icons.receipt, label: ratingCount.toString()),
                renderDot(),
                _IconText(icon: Icons.timelapse_outlined, label: '$deliveryTime분'),
                renderDot(),
                // 조건으로 값을 다르게 나타내기
                _IconText(icon: Icons.monetization_on, label: '${deliveryFee == 0 ? '무료' : deliveryFee.toString()}'),
              ],
            ),
          ],
        ),
      ],
    );
  }
  renderDot(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(' · ', style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
      ),),
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14.0,
        ),
        const SizedBox(width: 8.0),
        Text(label, style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),)
      ],
    );
  }
}
