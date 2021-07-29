import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/config/app_config.dart' as cnf;
import 'package:store_app/src/models/groupConversation.dart';
import 'package:store_app/src/widgets/SearchBarWidget.dart';
import 'package:store_app/view/productdetailsviewmodel.dart';

class AddToWishlist extends StatefulWidget {
  final ProductDetailsViewmodel model;
  AddToWishlist({this.model});

  @override
  _AddToWishlistState createState() => _AddToWishlistState();
}

class _AddToWishlistState extends State<AddToWishlist> {
  bool _initial = true;
  bool _isLoading = false;
  List<GroupConversation> groupList;
  Map<String, bool> list;
  bool myWishList = false;
  List<GroupConversation> searchList;
  @override
  void didChangeDependencies() {
    if (_initial) {
      _isLoading = true;
      Future.value(widget.model.fetchgroupList()).then((value) {
        groupList = value;
        searchList = groupList;
        list = Map.fromIterable(groupList,
            key: (group) => group.id.toString(), value: (group) => false);
        setState(() {
          _isLoading = false;
        });
      });
    }
    _initial = false;
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    final config = cnf.App(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: config.appHeight(80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Theme.of(context).primaryColor,
      ),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: config.appVerticalPadding(2.5),
          ),
          SearchBarWidget(
            filter: false,
            callback: (val, node) {
              if (node.hasPrimaryFocus) {
                setState(() {
                  groupList = groupList
                      .where((element) => element.title
                          .toLowerCase()
                          .contains(val.toLowerCase()))
                      .toList();
                });
              } else {
                setState(() {
                  groupList = searchList;
                });
              }
            },
          ),
          SizedBox(
            height: config.appVerticalPadding(1.5),
          ),
          SizedBox(
            height: config.appHeight(60),
            child: Card(
              elevation: 10,
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Card(
                          elevation: 10,
                          child: CheckboxListTile(
                            value: myWishList,
                            onChanged: (value) {
                              setState(() {
                                myWishList = !myWishList;
                              });
                            },
                            title: Text(
                              'My Wishlist',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            secondary: CircleAvatar(
                              backgroundImage: AssetImage('img/chatbot.jpg'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: config.appVerticalPadding(1.5),
                        ),
                        Expanded(
                          child: ListView.separated(
                              separatorBuilder: (ctx, i) => SizedBox(
                                    height: config.appVerticalPadding(1),
                                  ),
                              itemCount: groupList.length,
                              itemBuilder: (ctx, index) {
                                return groupList.map((e) {
                                  return CheckboxListTile(
                                    onChanged: (val) {
                                      print(list.keys);
                                      setState(() {
                                        list[e.id.toString()] =
                                            !list[e.id.toString()];
                                      });
                                    },
                                    value: list[e.id.toString()],
                                    secondary: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                e.image),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    // CircleAvatar(
                                    //   child: CachedNetworkImage(
                                    //     imageUrl: e.image,
                                    //     fit: BoxFit.cover,

                                    //   ),
                                    // ),
                                    title: Text(
                                      e.title,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }).toList()[index];
                              }),
                        ),
                      ],
                    ),
            ),
          ),
          SizedBox(
            height: config.appVerticalPadding(1.5),
          ),
          IconButton(
            onPressed: () {
              List<String> selected = [];
              list.forEach((key, value) {
                if (value) {
                  selected.add(key);
                }
              });
              widget.model.addToWishList(myWishList, selected);
            },
            icon: Container(
              width: config.appWidth(30),
              // padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).accentColor),
              child: Center(
                child: Text(
                  'Add',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
