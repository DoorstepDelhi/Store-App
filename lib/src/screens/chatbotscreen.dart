import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';
import 'package:flutter/material.dart';
import 'package:store_app/config/app_config.dart' as conf;
import 'package:store_app/config/ui_icons.dart';
import 'package:store_app/provider/base_view.dart';
import 'package:store_app/src/models/chat.dart';
import 'package:store_app/src/models/conversation.dart';
import 'package:store_app/src/models/product.dart';
import 'package:store_app/src/models/user.dart';
import 'package:store_app/src/widgets/ChatMessageListItemWidget.dart';
import 'package:store_app/src/widgets/RecommendedCarouselItemWidget.dart';
import 'package:store_app/view/chatbot_viewmodel.dart';

class ChatBot extends StatefulWidget {
  static const routeName = '/Chatbot';
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  ConversationsList _conversationList = new ConversationsList();
  User _currentUser = new User.init().getCurrentUser();
  final _listKey = GlobalKey<AnimatedListState>();
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = conf.App(context);
    return Scaffold(
      body: BaseView<ChatBotViewmodel>(
        onModelReady: (model) => model.initData(),
        builder: (ctx, model, child) {
          return Container(
            height: config.appHeight(100),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Dismissible(
                  key: UniqueKey(),
                  child: querySuggestions(context),
                  dismissThresholds: {DismissDirection.endToStart: 0.6},
                  background: Container(
                    height: config.appHeight(18),
                    color: Theme.of(context).accentColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RecommendProducts(),
                Expanded(
                  child: StreamBuilder(
                    builder: (ctx, snapshot) {
                      return AnimatedList(
                        key: _listKey,
                        reverse: true,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        initialItemCount:
                            _conversationList.conversations[1].chats.length,
                        itemBuilder:
                            (context, index, Animation<double> animation) {
                          Chat chat =
                              _conversationList.conversations[1].chats[index];
                          return ChatMessageListItem(
                            chat: chat,
                            animation: animation,
                          );
                        },
                      );
                    },
                  ),
                ),
                SendMessage(
                    controller: myController,
                    callback: (bool voiceMode) async {
                      if (voiceMode) {
                        print('yes it\'s ture');
                        _conversationList.conversations[1].chats.insert(
                            0,
                            new Chat(
                                text: myController.text,
                                time: '21min ago',
                                user: _currentUser));
                        DetectIntentResponse data2 = await model.dialogflow
                            .detectIntent(myController.text, 'en-US');
                        print(data2.queryResult.fulfillmentText);
                        _listKey.currentState.insertItem(0);
                        model.speak(data2.queryResult.fulfillmentText);
                      } else {
                        _conversationList.conversations[1].chats.insert(
                            0,
                            new Chat(
                                text: myController.text,
                                time: '21min ago',
                                user: _currentUser));
                        // DetectIntentResponse data2 = await model.dialogflow
                        //     .detectIntent(myController.text, 'en-US');
                        // print(data2.queryResult.fulfillmentText);
                        _listKey.currentState.insertItem(0);
                        final data = await model.listen();
                        print(data);
                      }
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget querySuggestions(BuildContext context) {
  final config = conf.App(context);
  return Container(
    height: config.appHeight(18),
    child: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text.rich(
          TextSpan(text: 'What can I do for you?'),
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1, color: Theme.of(context).hintColor)),
                child: Text(
                  'Delivery related query',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1, color: Theme.of(context).hintColor)),
                child: Text(
                  'Where\'s my order?',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1, color: Theme.of(context).hintColor)),
                child: Text(
                  'Cancel order',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1, color: Theme.of(context).hintColor)),
                child: Text(
                  'Best Deals for me',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1, color: Theme.of(context).hintColor)),
                child: Text(
                  'Delivery related query',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        width: 1, color: Theme.of(context).hintColor)),
                child: Text(
                  'Delivery related query',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class RecommendProducts extends StatefulWidget {
  @override
  _RecommendProductsState createState() => _RecommendProductsState();
}

class _RecommendProductsState extends State<RecommendProducts> {
  ProductsList _productsList = new ProductsList();
  bool show = false;
  @override
  Widget build(BuildContext context) {
    final config = conf.App(context);
    return Offstage(
      offstage: show,
      child: Container(
        height: config.appHeight(30),
        // color: Colors.red,
        child: Stack(
          children: [
            SizedBox(
              height: config.appHeight(30),
              child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: _productsList.flashSalesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  Product product =
                      _productsList.flashSalesList.elementAt(index);
                  return RecommendedCarouselItemWidget(
                    product: product,
                    heroTag: 'flash_sales',
                    marginLeft: 10.0,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 10.0,
                  );
                },
              ),
            ),
            Positioned(
                child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.black)),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    show = !show;
                  });
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class SendMessage extends StatefulWidget {
  final Function callback;
  final TextEditingController controller;
  SendMessage({this.callback, this.controller});
  @override
  _SendMessageState createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  bool _voicemode = false;
  @override
  Widget build(BuildContext context) {
    final config = conf.App(context);

    // final myController = TextEditingController();
    return Container(
      width: config.appWidth(100),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).hintColor.withOpacity(0.10),
              offset: Offset(0, -4),
              blurRadius: 10)
        ],
      ),
      child: TextField(
        controller: widget.controller,
        onChanged: (value) {
          if (value.trim().isNotEmpty) {
            setState(() {
              _voicemode = true;
            });
          } else {
            setState(() {
              _voicemode = false;
            });
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          hintText: 'Chat text here',
          hintStyle:
              TextStyle(color: Theme.of(context).focusColor.withOpacity(0.8)),
          suffixIcon: _voicemode
              ? IconButton(
                  padding: EdgeInsets.only(right: 30),
                  onPressed: () {
                    widget.callback(_voicemode);

                    Timer(Duration(milliseconds: 100), () {
                      widget.controller.clear();
                    });
                  },
                  icon: Icon(
                    UiIcons.cursor,
                    color: Theme.of(context).accentColor,
                    size: 30,
                  ),
                )
              : AvatarGlow(
                  endRadius: 40,
                  child: IconButton(
                    padding: EdgeInsets.only(right: 30),
                    onPressed: () {
                      widget.callback(_voicemode);
                    },
                    icon: Icon(
                      Icons.mic,
                      color: Theme.of(context).accentColor,
                      size: 30,
                    ),
                  ),
                ),
          border: UnderlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
