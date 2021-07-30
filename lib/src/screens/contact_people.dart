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
      "image": "img/temp/Rahul.jpeg",
    },
    {
      "name": "Raghav Shukla",
      "image": "img/temp/Raghav.jpeg",
    },
    {
      "name": "Ayush Mahajan",
      "image": "img/temp/Vinay.jpeg",
    },
    {
      "name": "Shivam Joshi",
      "image": "img/temp/yuvansh.jpeg",
    },
    {
      "name": "Rahul Dev",
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
            icon: new Icon(UiIcons.return_icon, color: Theme.of(context).hintColor),
          onPressed: () => Navigator.of(context).pop(),),
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
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage(contactList[index]["image"]),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 35),
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
