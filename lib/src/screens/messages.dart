import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_view.dart';
import 'package:store_app/src/screens/contact_people.dart';
import 'package:store_app/src/screens/nearby.dart';
import 'package:store_app/src/widgets/DrawerWidget.dart';
import 'package:store_app/src/widgets/ShoppingCartButtonWidget.dart';
import 'package:store_app/src/widgets/groupMessageItem.dart';
import 'package:store_app/view/groupChatViewModel.dart';

import '../models/conversation.dart' as model;
import '../widgets/EmptyMessagesWidget.dart';
import '../widgets/SearchBarWidget.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatefulWidget {
  @override
  _MessagesWidgetState createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  model.ConversationsList _conversationList;


  @override
  void initState() {
    this._conversationList = new model.GroupConversationsList();
    super.initState();
  }

  Icon newGroup = Icon(Icons.add, size: 23.0, color: Colors.white);
  Container invite = Container(
      height: 30,
      child: Image.asset(
        "img/invite.png",
        fit: BoxFit.fill,
        color: Colors.white,
      ));

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
          child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerWidget(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: new IconButton(
            icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Home",
            style: Theme.of(context).textTheme.display1,
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                  icon: Text(
                "Groups",
                style: Theme.of(context).textTheme.title,
              )),
              Tab(
                  icon: Text(
                "Chats",
                style: Theme.of(context).textTheme.title,
              )),
              Tab(
                  icon: Text(
                "Explore",
                style: Theme.of(context).textTheme.title,
              )),
              Tab(
                  icon: Text(
                "Nearby",
                style: Theme.of(context).textTheme.title,
              )),
            ],
          ),
          actions: <Widget>[
            new ShoppingCartButtonWidget(
                iconColor: Theme.of(context).hintColor,
                labelColor: Theme.of(context).accentColor),
            Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(300),
                  onTap: () {
                    Navigator.of(context).pushNamed('/Tabs', arguments: 4);
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage('img/user2.jpg'),
                  ),
                )),
          ],
        ),
        body: TabBarView(
          children: [
            groups(),
            chats(),
            Container(),
            Nearby()
          ],
        ),
      ),
    );
  }

  groups() {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 7),
          child:  Column(
            children: <Widget>[
            BaseView<GroupChatViewModel>(
                onModelReady: (model) => model.getGroupChat(context),
                builder: (ctx, model, child) => model.state ==
                        ViewState.Busy
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 150.0,
                        ),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Offstage(
                        offstage: model.groupConversations.isEmpty,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: model.groupConversations.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 7);
                          },
                          itemBuilder: (context, index) {
                            var conversation =
                                model.groupConversations[index];

                            return GroupMessageItemWidget(
                              message: conversation,
                              onDismissed: (conversation) {
                                setState(() {
                                  model.groupConversations
                                      .removeAt(index);
                                });
                              },
                            );
                          },
                        ),
                      ),
              ),
              Offstage(
                offstage: _conversationList.conversations.isNotEmpty,
                child: EmptyMessagesWidget(),
              ),
            ],
          ),
        ),
        Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(25.0),
                child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 55.0,
                      width: 55.0,
                      padding: EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: newGroup
                    )),
              )
      ],
    );
  }

  chats(){
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 7),
          child:  Column(
            children: <Widget>[
                      BaseView<GroupChatViewModel>(
                          onModelReady: (model) => model.getGroupChat(context),
                          builder: (ctx, model, child) => model.state ==
                                  ViewState.Busy
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 150.0,
                                  ),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : Offstage(
                                  offstage: model.groupConversations.isEmpty,
                                  child: ListView.separated(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: model.groupConversations.length,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: 7);
                                    },
                                    itemBuilder: (context, index) {
                                      var conversation =
                                          model.groupConversations[index];

                                      return GroupMessageItemWidget(
                                        message: conversation,
                                        onDismissed: (conversation) {
                                          setState(() {
                                            model.groupConversations
                                                .removeAt(index);
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ),
                        ),
              Offstage(
                offstage: _conversationList.conversations.isNotEmpty,
                child: EmptyMessagesWidget(),
              ),
            ],
          ),
        ),
        Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(25.0),
                child: GestureDetector(
                    onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ContactPeople()));
                      
                    },
                    child: Container(
                      height: 55.0,
                      width: 55.0,
                      padding: EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: invite),
                    )),
      ],
    );
  }
}
