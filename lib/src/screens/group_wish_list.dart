import 'package:flutter/material.dart';
import 'package:store_app/config/ui_icons.dart';
import 'package:store_app/src/models/group_cart_page.dart';
import 'package:store_app/src/screens/favorites.dart';

import 'cart.dart';

class GroupWishList extends StatefulWidget {
  @override
  _GroupWishListState createState() => _GroupWishListState();
}

class _GroupWishListState extends State<GroupWishList> {
  var labelCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 138, 62, 0.1),
        elevation: 0,
        title: appBarTitle(),
        automaticallyImplyLeading: false,
        leadingWidth: 25.0,
        leading: IconButton(
          icon:
              new Icon(UiIcons.return_icon, color: Theme.of(context).hintColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          appBarActions(),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 15.0,
          ),
          FavoritesWidget(),
        ],
      ),
    );
  }

  appBarTitle() {
    return Container(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Group Name",
                style: Theme.of(context).textTheme.body2,
              ),
              Text(
                "me, mem1 and 7 others",
                style: Theme.of(context).textTheme.body1,
              )
            ],
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
                Navigator.pushReplacement(context,
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
