import 'dart:math';

import 'package:flutter/material.dart';
import 'package:store_app/config/ui_icons.dart';
import 'package:store_app/provider/base_view.dart';
import 'package:store_app/src/screens/group_cart_page.dart';
import 'package:store_app/view/group_info_viewmodel.dart';

import 'group_wish_list.dart';

class NearbyGroupInfo extends StatefulWidget {
  // static const routeName = '/groupInfo';
  @override
  _NearbyGroupInfoState createState() => _NearbyGroupInfoState();
}

class _NearbyGroupInfoState extends State<NearbyGroupInfo> {
  var groupName = "Delhi Wholesalers", labelCount = 0;
  Image groupIcon = Image.network(
      "https://www.seoclerk.com/pics/want55776-16Dnv61508955325.png");
  var description =
      "Group Description:- aaaaaaaaaaa bbbbb vfddddddddds aaaaaaaafffgbnjk dyuhfcffffffds";
  List<dynamic> members = [
    {
      "name": "member 1",
      "imageUrl":
          "https://www.publicdomainpictures.net/pictures/270000/velka/avatar-people-person-business-.jpg"
    },
    {
      "name": "member 2",
      "imageUrl":
          "https://www.publicdomainpictures.net/pictures/270000/velka/avatar-people-person-business-.jpg"
    },
    {
      "name": "member 3",
      "imageUrl":
          "https://www.publicdomainpictures.net/pictures/270000/velka/avatar-people-person-business-.jpg"
    },
    {
      "name": "member 4",
      "imageUrl":
          "https://static.vecteezy.com/system/resources/thumbnails/001/980/744/small/little-boy-using-face-mask-for-covid19-in-the-camp-free-vector.jpg"
    },
    {
      "name": "member 5",
      "imageUrl":
          "https://static.vecteezy.com/system/resources/thumbnails/001/980/744/small/little-boy-using-face-mask-for-covid19-in-the-camp-free-vector.jpg"
    }
  ];

  List<dynamic> orderItems = [
    {
      "name": "item 1",
      "minQuantity": 50,
      "pricePerPiece": 20.0,
      "totalPrice": 800,
      "imageUrl":
          "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80"
    },
    {
      "name": "item 2",
      "minQuantity": 50,
      "pricePerPiece": 20.0,
      "totalPrice": 800,
      "imageUrl":
          "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80"
    },
    {
      "name": "item 3",
      "minQuantity": 50,
      "pricePerPiece": 20.0,
      "totalPrice": 800,
      "imageUrl":
          "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80"
    },
    {
      "name": "item 4",
      "minQuantity": 50,
      "pricePerPiece": 20.0,
      "totalPrice": 800,
      "imageUrl":
          "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80"
    },
    {
      "name": "item 5",
      "minQuantity": 50,
      "pricePerPiece": 20.0,
      "totalPrice": 800,
      "imageUrl":
          "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              leading: IconButton(
                icon:
                    new Icon(UiIcons.return_icon, color: Theme.of(context).hintColor),
                onPressed: () => Navigator.of(context).pop(),
              ),
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("${groupName}",
                      style: Theme.of(context).textTheme.title,),
                  background: groupIcon),
            ),
          ];
        },
        body: BaseView<GroupInfoViewModel>(
        // onModelReady: ,
        builder: (ctx, model, child) {
          return ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.body2,
                    ),
                    Text(
                      "${description}",
                      style: Theme.of(context).textTheme.body1,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: TabBar(
                        tabs: [
                          Tab(icon: Text("Group Members", style: Theme.of(context).textTheme.body2,)),
                          Tab(icon: Text("Group Orders", style: Theme.of(context).textTheme.body2,)),
                        ],
                      ),
                    ),
                    Container(
                      height: 80.0 * max((members.length) + 1, orderItems.length),
                      child: TabBarView(
                          children: [groupMembers(), groupOrders()]),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
      ),
    );
  }

  groupMembers() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Group Members",
                    style: Theme.of(context).textTheme.body2,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                            child: Image.network(
                                "https://www.divinesolitaires.com/upload/images/slug-master/jklmn07083png.png")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Text(
                            "Add Participants",
                            style: Theme.of(context).textTheme.body2,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                for (int i = 0; i < members.length; i++) memberContainer(i),
              ],
            ),
          ),
        ],
      ),
    );
  }

  groupOrders() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Group Orders",
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
              for (int i = 0; i < orderItems.length; i++) itemContainer(i),
            ],
          ),
        ),
      ],
    );
  }

  itemContainer(int i) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10.0), boxShadow: [
        BoxShadow(
          color: Colors.greenAccent[200],
          offset: const Offset(
            2.0,
            2.0,
          ),
          blurRadius: 5.0,
          spreadRadius: 1.0,
        ), //BoxShadow
        BoxShadow(
          color: Colors.white,
          offset: const Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.0,
        ),
      ]),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.network(orderItems[i]["imageUrl"], fit: BoxFit.fill),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(orderItems[i]["name"]),
                      SizedBox(width: 20.0),
                      Text("min qty: ${orderItems[i]["minQuantity"]}"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("per piece: Rs. ${orderItems[i]["pricePerPiece"]}"),
                      SizedBox(width: 20.0),
                      Text("total: Rs. ${orderItems[i]["totalPrice"]}"),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  memberContainer(int i) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(child: Image.network(members[i]["imageUrl"])),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text(
                members[i]["name"],
                style: Theme.of(context).textTheme.body2,
              ),
            ),
          )
        ],
      ),
    );
  }

  appBarTitle() {
    return GestureDetector(
      child: Row(
        children: [
          Container(
              width: 35,
              height: 35,
              margin: EdgeInsets.only(top: 7, bottom: 7, right: 10),
              child: InkWell(
                borderRadius: BorderRadius.circular(300),
                onTap: () {
                  Navigator.of(context).pushNamed('/Tabs', arguments: 1);
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('img/user2.jpg'),
                ),
              )),
          Container(
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delhi Wholesalers",
                  style: Theme.of(context).textTheme.body2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "You, Raghav and 7 others",
                  style: Theme.of(context).textTheme.body1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  popUpOptionMemu() {
    return PopupMenuButton<ChatBoxMenu>(
      onSelected: (ChatBoxMenu result) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ChatBoxMenu>>[
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.GroupInfo,
          child: Text('Group Info'),
        ),
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.Search,
          child: Text('Search'),
        ),
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.GroupMedia,
          child: Text('Group Media'),
        ),
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.ExitGroup,
          child: Text('Exit Group'),
        ),
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.AddShortcut,
          child: Text('Add Shortcut'),
        ),
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.GoToFirstMessage,
          child: Text('Go To First Message'),
        ),
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.Report,
          child: Text('Report'),
        ),
        const PopupMenuItem<ChatBoxMenu>(
          value: ChatBoxMenu.Orders,
          child: Text('Orders'),
        ),
      ],
    );
  }

  appBarActions() {
    return Container(
      width: 130,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => GroupWishList()));
              },
              icon: new Icon(
                UiIcons.heart,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: new FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => GroupCartPage()));
              },
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Icon(
                      UiIcons.shopping_cart,
                      color: Theme.of(context).accentColor,
                      size: 28,
                    ),
                  ),
                  Container(
                    child: Text(
                      labelCount.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption.merge(
                            TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 9),
                          ),
                    ),
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).hintColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    constraints: BoxConstraints(
                        minWidth: 15,
                        maxWidth: 15,
                        minHeight: 15,
                        maxHeight: 15),
                  ),
                ],
              ),
              color: Colors.transparent,
            ),
          ),
          Expanded(flex: 2, child: popUpOptionMemu()),
        ],
      ),
    );
  }
}

enum ChatBoxMenu {
  GroupInfo,
  Search,
  GroupMedia,
  ExitGroup,
  AddShortcut,
  GoToFirstMessage,
  Report,
  Orders
}