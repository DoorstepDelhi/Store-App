import '../models/conversation.dart' as model;
import '../widgets/EmptyMessagesWidget.dart';
import '../widgets/MessageItemWidget.dart';
import '../widgets/SearchBarWidget.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatefulWidget {
  @override
  _MessagesWidgetState createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget>
    with SingleTickerProviderStateMixin {
  var topNavigator1 = true,
      topNavigator2 = false,
      topNavigator3 = false,
      topNavigator4 = false;
  model.ConversationsList _conversationList;
  TabController _tabController;

  int _selectedIndex = 0;
  List<Widget> list = [
    Tab(
      text: 'People Nearby',
    ),
    Tab(text: 'Groups Nearby'),
  ];

  @override
  void initState() {
    this._conversationList = new model.GroupConversationsList();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      print("Selected Index: " + _tabController.index.toString());
    });
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
    // TODO: implement build
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Column(
            children: <Widget>[
              Container(
                color: Theme.of(context).primaryColor,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        onPressed: () {
                          setState(() {
                            _conversationList =
                                new model.GroupConversationsList();
                            topNavigator1 = true;
                            topNavigator2 = false;
                            topNavigator3 = false;
                            topNavigator4 = false;
                          });
                        },
                        child: topNavigator1
                            ? topNavigator("Group", Theme.of(context).hintColor)
                            : topNavigator("Group", null),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        onPressed: () {
                          setState(() {
                            _conversationList = new model.ConversationsList();
                            topNavigator1 = false;
                            topNavigator2 = true;
                            topNavigator3 = false;
                            topNavigator4 = false;
                          });
                        },
                        child: topNavigator2
                            ? topNavigator("Chats", Theme.of(context).hintColor)
                            : topNavigator("Chats", null),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        onPressed: () {
                          setState(() {
                            _conversationList = new model.ConversationsList();
                            topNavigator1 = false;
                            topNavigator2 = false;
                            topNavigator3 = true;
                            topNavigator4 = false;
                          });
                        },
                        child: topNavigator3
                            ? topNavigator(
                                "Contacts", Theme.of(context).hintColor)
                            : topNavigator("Contacts", null),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        onPressed: () {
                          setState(() {
                            _conversationList =
                                new model.PeopleNearbyConversationsList();
                            topNavigator1 = false;
                            topNavigator2 = false;
                            topNavigator3 = false;
                            topNavigator4 = true;
                          });
                        },
                        child: topNavigator4
                            ? topNavigator(
                                "Nearby", Theme.of(context).hintColor)
                            : topNavigator("Nearby", null),
                      ),
                    ),
                  ],
                ),
              ),
              if (!topNavigator4)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SearchBarWidget(),
                ),
              (topNavigator4)
                  ? TabBar(
                      tabs: list,
                      controller: _tabController,
                    )
                  : Offstage(
                      offstage: _conversationList.conversations.isEmpty,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shrinkWrap: true,
                        primary: false,
                        itemCount: _conversationList.conversations.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 7);
                        },
                        itemBuilder: (context, index) {
                          return MessageItemWidget(
                            message: _conversationList.conversations
                                .elementAt(index),
                            onDismissed: (conversation) {
                              setState(() {
                                _conversationList.conversations.removeAt(index);
                              });
                            },
                          );
                        },
                      ),
                    ),
              (topNavigator4
                  ? TabBarView(controller: _tabController, children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15.0),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "People Nearby",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Visible(),
                          ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: nearbyPeople.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 7);
                            },
                            itemBuilder: (context, index) {
                              return nearby(index);
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15.0),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "People Nearby",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Visible(),
                          ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: nearbyPeople.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 7);
                            },
                            itemBuilder: (context, index) {
                              return nearby(index);
                            },
                          ),
                        ],
                      ),
                    ])
                  : Container()),
              Offstage(
                offstage: _conversationList.conversations.isNotEmpty,
                child: EmptyMessagesWidget(),
              ),
            ],
          ),
        ),
        (topNavigator1 || topNavigator2 || topNavigator3)
            ? Container(
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
                      child: topNavigator1
                          ? newGroup
                          : (topNavigator2 ? invite : invite),
                    )),
              )
            : Container(),
      ],
    );
  }

  Widget topNavigator(String text, Color color) {
    return Column(
      children: <Widget>[
        Text(
          text,
          style: Theme.of(context).textTheme.title,
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          height: 3.0,
          color: color,
        ),
      ],
    );
  }

  List<Map<dynamic, dynamic>> nearbyPeople = [
    {
      "name": "Saksham Mittal",
      "distance": 570,
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Saksham Mittal",
      "distance": 570,
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Saksham Mittal",
      "distance": 570,
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Saksham Mittal",
      "distance": 570,
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Saksham Mittal",
      "distance": 570,
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Saksham Mittal",
      "distance": 570,
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    },
    {
      "name": "Saksham Mittal",
      "distance": 570,
      "image":
          "https://assets.entrepreneur.com/content/3x2/2000/20150820205507-single-man-outdoors-happy-bliss.jpeg"
    }
  ];

  Widget nearby(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage("${nearbyPeople[index]["image"]}"),
                ),
              ),
            ],
          ),
          SizedBox(width: 15),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "${nearbyPeople[index]["name"]}",
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Theme.of(context).textTheme.body2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "${nearbyPeople[index]["distance"]} m away in Delhi NCR",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .merge(TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget Visible() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                    radius: 7.0,
                    child: Image.asset(
                      "img/peopleNearby.png",
                      fit: BoxFit.fill,
                      color: Theme.of(context).accentColor,
                    )),
              ),
            ],
          ),
          SizedBox(width: 15),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Make Myself Visible",
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Theme.of(context).textTheme.body2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
