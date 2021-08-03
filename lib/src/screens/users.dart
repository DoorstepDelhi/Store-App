import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/config/ui_icons.dart';
import 'dart:math';

class UserList extends StatefulWidget {
  const UserList({Key key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

Random random = Random();
List names = [
  "Blake Bird",
  "Avery Howell",
  "Dexter Ward",
  "Hunter Bradley",
  "Bill Buckley",
  "Vera Marsh",
  "Ruth Burton",
  "Carmen Blake",
  "Paige Lawrence",
  "Geneva Mccoy",
  "Cecilia Abbott",
];
List friends = List.generate(
    13,
    (index) => {
          "name": names[random.nextInt(10)],
          "dp": "assets/images/dm${random.nextInt(4)}.jpg",
          "status": "Anything could be here",
          "isAccept": random.nextBool(),
        });

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                itemCount: friends.length,
                itemBuilder: (BuildContext context, int index) {
                  Map friend = friends[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5),
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        height: 55,
                        width: 55,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'img/temp/Rahul.jpeg',
                            ),
                          ),
                        ),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      title: Text(friend['name']),
                      subtitle: Text(friend['status']),
                      trailing: friend['isAccept']
                          ? Container(
                              width: 100.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                                color: Theme.of(context).backgroundColor,
                              ),
                              child: FlatButton(
                                child: Text(
                                  'Unfollow',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                textColor: Theme.of(context).accentColor,
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {},
                              ),
                            )
                          : Container(
                              width: 80.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                                color: Theme.of(context).accentColor,
                              ),
                              child: FlatButton(
                                child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                textColor: Theme.of(context).primaryColor,
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {},
                              ),
                            ),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
