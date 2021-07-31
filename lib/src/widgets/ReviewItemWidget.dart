import 'package:cached_network_image/cached_network_image.dart';
import 'package:store_app/services/api_urls.dart';
import 'package:store_app/src/models/userReviews.dart';

import '../../config/ui_icons.dart';
import '../models/review.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReviewItemWidget extends StatelessWidget {
  UserReviews review;

  ReviewItemWidget({Key key, this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 10,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        'https://30e99cf29431.ngrok.io' +
                            review.userDetail.profilePic),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              review.userDetail.firstName +
                                  " " +
                                  review.userDetail.lastName,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.title.merge(
                                  TextStyle(
                                      color: Theme.of(context).hintColor)),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  UiIcons.calendar,
                                  color: Theme.of(context).focusColor,
                                  size: 20,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  review.createdAt.substring(0, 10) +
                                      " " +
                                      review.createdAt.substring(11, 16),
                                  style: Theme.of(context).textTheme.caption,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                              ],
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                      Chip(
                        padding: EdgeInsets.all(0),
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(review.rating.toString(),
                                style: Theme.of(context).textTheme.body2.merge(
                                    TextStyle(
                                        color:
                                            Theme.of(context).primaryColor))),
                            Icon(
                              Icons.star_border,
                              color: Theme.of(context).primaryColor,
                              size: 16,
                            ),
                          ],
                        ),
                        backgroundColor:
                            Theme.of(context).accentColor.withOpacity(0.9),
                        shape: StadiumBorder(),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Text(
          review.review,
          style: Theme.of(context).textTheme.body1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          maxLines: 3,
        )
      ],
    );
  }
}
