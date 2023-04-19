import 'package:delivery_app_clone_flutter/restaruant/component/restaurant_card.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // appBar 제외 하고 나머지 공간에만 view를 넣을 거기 때문에 scaffold 필요 없음
    // scaffold 영역 모두 차지하게 만듬
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RestaurantCard(
            image: Image.asset('asset/img/food/ddeok_bok_gi.jpg', fit: BoxFit.cover,),
            name: '불타는 떡볶이',
            tags: ['떡볶이', '치즈', '매운맛'],
            ratingCount: 100,
            deliveryTime: 15,
            deliveryFee: 2000,
            rating: 4.52,
          ),
        ),
      ),
    );
  }
}
