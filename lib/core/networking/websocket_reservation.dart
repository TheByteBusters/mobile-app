import 'dart:convert';

import 'package:mobile_app/core/cache/auth_cache.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

const _urlAddress = 'wss://backend-2-0-jftw.onrender.com';
final _url = Uri.parse(_urlAddress);
final WebSocketChannel channel = WebSocketChannel.connect(_url);

class WebSocketReservation {
  static authUser() {
    print(channel.hashCode);
    print('before sink add');
    final token = AuthCache.getCacheData('token');
    final json = jsonEncode({
      "type": "authorization",
      "token": token,
    });
    channel.sink.add(json);
  }

  static sendReservation(String json) async {
    channel.sink.add('hello');
  }
}
