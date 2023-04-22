import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';


// 어디서든 사용하도록 이동
final storage = FlutterSecureStorage();

/**localhost*/
// 안드로이드 에뮬레이터는 ip가 좀 다름
final emulatorIp = '10.0.2.2:3000';
// 아이폰 시뮬레이터는 현재 내 컴퓨터 네트워크와 같음
final simulatorIp = '127.0.0.1:3000';

final ip = Platform.isIOS ? simulatorIp : emulatorIp;