import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_model.dart';
import 'package:store_app/provider/getit.dart';
import 'package:store_app/services/api_services.dart';
import 'package:store_app/services/api_urls.dart';
import 'package:store_app/services/prefs_services.dart';
import 'package:store_app/src/models/chat.dart';
import 'package:store_app/src/models/conversation.dart';
import 'package:store_app/src/models/groupConversation.dart';
import 'package:store_app/src/models/user.dart';
// import 'package:store_app/src/models/conversation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:dialogflow_grpc/v2beta1.dart';
// import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';
import 'package:dialogflow_grpc/dialogflow_auth.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';

class ChatViewModel extends BaseModel {
  ApiService _apiService = ApiService();
  final myController = TextEditingController();
  GroupConversation conversation;
  final myListKey = GlobalKey<AnimatedListState>();
  List initialData = [];
  final user = getIt.get<User>();
  WebSocketChannel socket;
  WebSocketChannel recommendationSocket;
  DialogflowGrpcV2Beta1 dialogflow;

  void initData(GroupConversation gConversation) async {
    conversation = gConversation;
    setState(viewState: ViewState.Busy);
    if (conversation.chats.isEmpty) {
      final data =
          await _apiService.fetchChats(id: gConversation.id.toString());
      if (!data.error) {
        print('it already');
        initialData = data.data;
      }
    }
    try {
      print(state);
      socket = IOWebSocketChannel.connect(
        Uri.parse('wss://30e99cf29431.ngrok.io/ws/chat/${conversation.name}/'),
        headers: {HttpHeaders.authorizationHeader: 'Token ${user.token}'},
      );
      recommendationSocket = IOWebSocketChannel.connect(
        Uri.parse(
            'wss://30e99cf29431.ngrok.io/ws/recommendation/${conversation.name}/'),
        headers: {HttpHeaders.authorizationHeader: 'Token ${user.token}'},
      );
      final serviceAccount = ServiceAccount.fromString(
          '${(await rootBundle.loadString('img/credentials.json'))}');

      dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
    } on SocketException catch (e) {
      print('error: ' + e.toString());
    }
    setState(viewState: ViewState.Idle);

    print('object ka nam');
  }

  void updateChat(dynamic data) {
    print('inside updatechat');
    if (data is List) {
      print('object');
      if (conversation.chats.isEmpty) {
        for (var x in data) {
          final chat = Chat.fromJson(x);

          conversation.chats.insert(0, chat);
        }
      }
    } else {
      print(data.toString() + 'line 100');
      final newdata = jsonDecode(data.toString()) as Map<String, dynamic>;
      final chat = Chat.fromJson(newdata);
      conversation.chats.insert(0, chat);
      myListKey.currentState.insertItem(0);
    }
  }
}
