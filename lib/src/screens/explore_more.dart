import 'package:flutter/material.dart';
import 'package:store_app/config/ui_icons.dart';
import 'package:store_app/enum/view_state.dart';
import 'package:store_app/provider/base_view.dart';
import 'package:store_app/src/models/nearbyGroups.dart';
import 'package:store_app/src/models/nearbyPeople.dart';
import 'package:store_app/src/widgets/social_post.dart';
import 'package:store_app/view/nearbyGroupsModel.dart';
import 'package:store_app/view/nearbyViewModel.dart';

import 'nearby_group_info.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
import 'package:flutter/services.dart';

class ExploreMore extends StatefulWidget {
  const ExploreMore({key}) : super(key: key);

  @override
  _ExploreMoreState createState() => _ExploreMoreState();
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

List hash = [
  "#love, #instagood, #me",
  "#tbt, #cute, #follow, #followme",
  "Lenard Milton",
  "#photooftheday, #happy, #tagforlikes, #beautiful",
  "#self, #girl, #picoftheday, #like4like",
  "Guadalupe Ratledge",
  "#smile, #friends, #fun",
  "#food, #swag, #amazing, #tflers",
  "#style, #wcw, #family",
  "#pretty, #repost, #hair",
  "#girls, #all_shots, #party",
];

List messages = [
  "I am a traveler",
  "Are you available tomorrow?",
  "It's late. Go to bed!",
  "I know what I want - Confidence",
  "I work in an office",
  "The last rocket🚀",
  "I do NOT work in an office",
  "Will you be attending the meetup tomorrow?",
  "Are you angry at something?",
  "I am a bit of a bright spark - Intelligence",
  "Can i hear your voice?",
];
List posts = List.generate(
    4,
    (index) => {
          "name": names[random.nextInt(10)],
          "dp": "img/images/dm${random.nextInt(4)}.jpg",
          "des": messages[random.nextInt(10)],
          "hash": hash[random.nextInt(10)],
          "img": "img/images/dm${random.nextInt(4)}.jpg"
        });

class _ExploreMoreState extends State<ExploreMore> {
  List<Widget> list = List.generate(
    posts.length,
    (index) {
      Map post = posts[index];
      return HomeCard(
        dp: post["dp"],
        name: post['name'],
        img: "img/images/dm1.jpg",
        des: post['des'],
        hash: post['hash'],
      );
    },
  );
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
    );
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: list.length,
                    itemBuilder: (ctx, index) {
                      return list[index];
                    }),
                //     SingleChildScrollView(
                //   physics: NeverScrollableScrollPhysics(),
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         height: 20,
                //       ),
                //       ...List.generate(
                //         posts.length,
                //         (index) {
                //           Map post = posts[index];
                //           return HomeCard(
                //             dp: post["dp"],
                //             name: post['name'],
                //             img: "img/images/dm1.jpg",
                //             des: post['des'],
                //             hash: post['hash'],
                //           );
                //         },
                //       ),
                //     ],
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
