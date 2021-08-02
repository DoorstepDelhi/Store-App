import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:store_app/provider/base_model.dart';

import 'package:dialogflow_grpc/dialogflow_auth.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:store_app/provider/getit.dart';
import 'package:store_app/services/api_urls.dart';
import 'package:store_app/services/prefs_services.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatBotViewmodel extends BaseModel {
  DialogflowGrpcV2Beta1 dialogflow;
  FlutterTts flutterTts = FlutterTts();
  SpeechToText stt = SpeechToText();
  WebSocketChannel socket;
  double confidence;
  TextEditingController controller = TextEditingController();
  bool isListening = false;
  final prefs = getIt.get<Prefs>();
  void initData() async {
    final serviceAccount = ServiceAccount.fromString(
        '${(await rootBundle.loadString('img/credentials.json'))}');

    dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
    // socket = IOWebSocketChannel.connect(
    //   Uri.parse(chatsocketurl),
    //   headers: {HttpHeaders.authorizationHeader: 'Token ${prefs.getToken()}'},
    // );

    flutterTts.awaitSpeakCompletion(true);
    flutterTts.awaitSynthCompletion(true);
  }

  Future speak(String text) async {
    var result = await flutterTts.speak(text);
  }

  Future listen() async {
    if (!isListening) {
      bool available = await stt.initialize(onStatus: (speech) {
        print(speech);
      }, onError: (error) {
        print(error);
      });
      if (available) {
        isListening = true;
        setState();
        stt.listen(
          onResult: (result) {
            controller.text = result.recognizedWords;
            if (result.hasConfidenceRating && result.confidence > 0) {
              confidence = result.confidence;
            }
            setState();
          },
          // localeId: selectedLocale.localeId,
        );
      }
    } else {
      isListening = false;
      stt.stop();
      setState();
    }
  }
}
