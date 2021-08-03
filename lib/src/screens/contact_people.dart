import 'package:flutter/material.dart';
import 'package:store_app/config/ui_icons.dart';

class ContactPeople extends StatefulWidget {
  @override
  _ContactPeopleState createState() => _ContactPeopleState();
}

class _ContactPeopleState extends State<ContactPeople> {
  List<Map<dynamic, dynamic>> contactList = [
    {
      "name": "Saksham Mittal",
      "about": "Hey There! Checkout my Store",
      "image": "img/temp/Rahul.jpeg",
    },
    {
      "name": "Raghav Shukla",
      "about": "Hey There! Checkout my Store",
      "image": "img/temp/Raghav.jpeg",
    },
    {
      "name": "Ayush Mahajan",
      "about": "Hey There! Checkout my Store",
      "image": "img/temp/Vinay.jpeg",
    },
    {
      "name": "Shivam Joshi",
      "about": "Hey There! Checkout my Store",
      "image": "img/temp/yuvansh.jpeg",
    },
    {
      "name": "Rahul Dev",
      "about": "Mai Chutiya hu",
      "image": "img/temp/Rahul.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        elevation: 0,
        leading: new IconButton(
          icon:
              new Icon(UiIcons.return_icon, color: Theme.of(context).hintColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 15),
        shrinkWrap: true,
        primary: false,
        itemCount: contactList.length,
        separatorBuilder: (context, index) {
          return SizedBox(height: 7);
        },
        itemBuilder: (context, index) {
          var person = contactList[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage(contactList[index]["image"]),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Text(
                  contactList[index]["name"],
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  contactList[index]["name"],
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
