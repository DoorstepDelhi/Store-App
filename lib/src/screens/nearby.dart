import 'package:flutter/material.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_view.dart';
import 'package:store_app/src/models/nearbyGroups.dart';
import 'package:store_app/src/models/nearbyPeople.dart';
import 'package:store_app/view/nearbyGroupsModel.dart';
import 'package:store_app/view/nearbyViewModel.dart';

class Nearby extends StatefulWidget {
  const Nearby({key}) : super(key: key);

  @override
  _NearbyState createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              options(0, "People Nearby"),
              options(1, "Groups Nearby"),
            ],
          ),
        ),
        optionIndex == 0 ? peopleNearby() : groupsNearby(),
      ],
    );
  }

  int optionIndex = 0;

  Widget options(int index, String title) {
    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
            optionIndex = index;
          });
        },
        child: Container(
          alignment: Alignment.center,
          height: 35.0,
          width: 1.2 * MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            color: index == optionIndex ? Colors.blue : Colors.black,
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget peopleNearby() {
    return BaseView<NearbyViewModel>(
      onModelReady: (model) => model.getNearbyPeople(context),
      builder: (ctx, model, child) => model.state == ViewState.Busy
          ? Padding(
              padding: EdgeInsets.symmetric(
                vertical: 150.0,
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
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
                  itemCount: model.nearbyPeopleList.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 7);
                  },
                  itemBuilder: (context, index) {
                    var person = model.nearbyPeopleList[index];
                    return nearby(person);
                  },
                ),
              ],
            ),
    );
  }

  Widget nearby(NearbyPeople person) {
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
                  backgroundImage: NetworkImage("${person.profile_pic}"),
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
                  "${person.first_name + " " + person.last_name}",
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Theme.of(context).textTheme.body2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "${person.distance.toStringAsFixed(1)}  m away in Delhi NCR",
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

  Widget nearbyG(NearbyGroups group) {
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
                  backgroundImage: NetworkImage("${group.image}"),
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
                  group.title,
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

  Widget groupsNearby() {
    return BaseView<NearbyGroupsViewModel>(
      onModelReady: (model) => model.getNearbyGroups(context),
      builder: (ctx, model, child) => model.state == ViewState.Busy
          ? Padding(
              padding: EdgeInsets.symmetric(
                vertical: 150.0,
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Groups Nearby",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: model.nearbyGroupsList.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 7);
                  },
                  itemBuilder: (context, index) {
                    final group = model.nearbyGroupsList[index];
                    return nearbyG(group);
                  },
                ),
              ],
            ),
    );
  }
}
