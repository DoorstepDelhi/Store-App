import 'package:store_app/src/models/userReviews.dart';

import '../models/review.dart';
import '../widgets/ReviewItemWidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReviewsListWidget extends StatefulWidget {
  final Future<List<UserReviews>> reviews;

  // ReviewsList _reviewsList = new ReviewsList();

  ReviewsListWidget({Key key, this.reviews}) : super(key: key);

  @override
  _ReviewsListWidgetState createState() => _ReviewsListWidgetState();
}

class _ReviewsListWidgetState extends State<ReviewsListWidget> {
  List<UserReviews> userReviews = [];
  bool _initial = true;
  @override
  void didChangeDependencies() {
    if (_initial) {
      Future.value(widget.reviews).then((value) {
        setState(() {
          userReviews = value;
        });
      });
    }
    _initial = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(userReviews);
    return userReviews.isEmpty
        ? Center(child: CircularProgressIndicator())
        : ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              return ReviewItemWidget(review: userReviews.elementAt(index));
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 30,
              );
            },
            itemCount: userReviews.length,
            primary: false,
            shrinkWrap: true,
          );
  }
}
