import 'package:delivery_app_clone_flutter/common/const/data.dart';
import 'package:delivery_app_clone_flutter/restaruant/component/restaurant_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  Future<List> paginateRestaurant() async {
    final dio = Dio();

    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    // http 요청시 async로 가져오기
    final resp = await dio.get(
      'http://$ip/restaurant',
      options: Options(headers: {'authorization': 'Bearer $accessToken'}),
    );
    // resp.data = 실제 body 값
    // 실제 있는 값만 반환
    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    // appBar 제외 하고 나머지 공간에만 view를 넣을 거기 때문에 scaffold 필요 없음
    // scaffold 영역 모두 차지하게 만듬
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          // FutureBuilder에 어떤 값이 들어올지 명시
          // FutureBuilder<List>
          child: FutureBuilder<List>(
            // futureBuilder의 데이터 로드 함수 명시
            future: paginateRestaurant(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              // 데이터가 없는 경우
              if (!snapshot.hasData) {
                return Container();
              }

              // 데이터가 있는 경우
              return ListView.separated(
                  itemBuilder: (context, index) {
                    // snapshot.data 데이터 갯수가 몇개가 필요 한지
                    // snapshot.data[index] : 여러개의 데이터 리스트 중 순서대로 가져옴
                    final item = snapshot.data![index];

                    return RestaurantCard(
                      image: Image.network('http://$ip${item['thumbUrl']}', fit: BoxFit.cover,),
                      // image: Image.asset(
                      //   'asset/img/food/ddeok_bok_gi.jpg',
                      //   fit: BoxFit.cover,
                      // ),
                      name: item['name'],
                      // 들어 오는 데이터가 List<String>일 경우 List<String> 명시 해주기
                      // default List<dynamic>으로 들어옴
                      tags: List<String>.from(item['tags']),
                      ratingsCount: item['ratingsCount'],
                      deliveryTime: item['deliveryTime'],
                      deliveryFee: item['deliveryFee'],
                      ratings: item['ratings'],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16.0,
                    );
                  },
                  itemCount: snapshot.data!.length);
            },
          ),
        ),
      ),
    );
  }
}
