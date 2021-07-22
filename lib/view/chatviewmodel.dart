import 'dart:io';

import 'package:http/http.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/provider/getit.dart';
import 'package:store_app/services/api_urls.dart';
import 'package:store_app/services/prefs_services.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatViewModel extends BaseModel {
  final _prefs = getIt.get<Prefs>();
  WebSocketChannel socket;

  void initData() async {
    print('object ka nam');
    try {
      setState(viewState: ViewState.Busy);
      socket = IOWebSocketChannel.connect(
        Uri.parse(chatsocketurl),
        headers: {
          HttpHeaders.authorizationHeader: 'Token ${_prefs.getToken()}'
        },
      );
      setState(viewState: ViewState.Idle);
      // socket = WebSocketChannel.connect(
      //   Uri.parse(chatsocketurl),
      // );
    } on SocketException catch (e) {
      print('error: ' + e.toString());
    }
  }
}
