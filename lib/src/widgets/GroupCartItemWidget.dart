import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:store_app/config/app_config.dart' as cnf;
import 'package:store_app/config/ui_icons.dart';
import 'package:store_app/src/models/product_color.dart';

import '../models/product.dart';
import '../models/route_argument.dart';
import 'package:flutter/material.dart';

class GroupCartItemWidget extends StatefulWidget {
  String heroTag;
  Product product;
  int quantity;

  GroupCartItemWidget({Key key, this.product, this.heroTag, this.quantity = 1})
      : super(key: key);

  @override
  _GroupCartItemWidgetState createState() => _GroupCartItemWidgetState();
}

class _GroupCartItemWidgetState extends State<GroupCartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      focusColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).primaryColor,
      onTap: () {
        // Navigator.of(context).pushNamed('/Product',
        //     arguments: RouteArgument(
        //         id: widget.product.id,
        //         argumentsList: [widget.product, widget.heroTag]));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.9),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).focusColor.withOpacity(0.1),
                blurRadius: 5,
                offset: Offset(0, 2)),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: widget.heroTag + widget.product.id,
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                          image: AssetImage(widget.product.image),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.product.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.subhead,
                            ),
                            Text(
                              widget.product
                                  .getPrice(myPrice: Random().nextInt(500)),
                              style: Theme.of(context).textTheme.display1,
                            ),
                            Text(
                              "Group/ Min. Qty.  ${Random().nextInt(8)}/10",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5)),
              child: ExpandablePanel(
                  theme: ExpandableThemeData(
                    iconColor: Theme.of(context).hintColor,
                  ),
                  header: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Text(
                      'Item Choices',
                      style: TextStyle(
                          color: Theme.of(context).hintColor, fontSize: 16),
                    ),
                  ),
                  collapsed: Container(),
                  expanded: Container(
                    width: cnf.App(context).appWidth(100),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: cnf.App(context).appHeight(5),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    SizedBox(
                                      width: 38,
                                      height: 38,
                                      child: FilterChip(
                                        label: Text(''),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 7),
                                        backgroundColor: Colors.blueAccent,
                                        selectedColor: Colors.blueAccent,
                                        selected: true,
                                        shape: StadiumBorder(),
                                        avatar: Text(''),
                                        onSelected: (bool value) {},
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    SizedBox(
                                      height: 38,
                                      child: RawChip(
                                        label: Text('M'),
                                        labelStyle: TextStyle(
                                            color: Theme.of(context).hintColor),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 7),
                                        backgroundColor: Theme.of(context)
                                            .focusColor
                                            .withOpacity(0.05),
                                        selectedColor: Theme.of(context)
                                            .focusColor
                                            .withOpacity(0.2),
                                        selected: true,
                                        shape: StadiumBorder(
                                            side: BorderSide(
                                                color: Theme.of(context)
                                                    .focusColor
                                                    .withOpacity(0.05))),
                                        onSelected: (bool value) {
                                          // setState(() {
                                          //   size.selected = value;
                                          // });
                                        },
                                      ),
                                    )
                                  ],
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.quantity = this
                                          .decrementQuantity(widget.quantity);
                                    });
                                  },
                                  iconSize: 30,
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  icon: Icon(Icons.remove_circle_outline),
                                  color: Theme.of(context).hintColor,
                                ),
                                Text(widget.quantity.toString(),
                                    style: Theme.of(context).textTheme.subhead),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.quantity = this
                                          .incrementQuantity(widget.quantity);
                                    });
                                  },
                                  iconSize: 30,
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  icon: Icon(Icons.add_circle_outline),
                                  color: Theme.of(context).hintColor,
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: cnf.App(context).appHeight(5),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    SizedBox(
                                      width: 38,
                                      height: 38,
                                      child: FilterChip(
                                        label: Text(''),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 7),
                                        backgroundColor: Colors.greenAccent,
                                        selectedColor: Colors.greenAccent,
                                        selected: true,
                                        shape: StadiumBorder(),
                                        avatar: Text(''),
                                        onSelected: (bool value) {},
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    SizedBox(
                                      height: 38,
                                      child: RawChip(
                                        label: Text('S'),
                                        labelStyle: TextStyle(
                                            color: Theme.of(context).hintColor),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 7),
                                        backgroundColor: Theme.of(context)
                                            .focusColor
                                            .withOpacity(0.05),
                                        selectedColor: Theme.of(context)
                                            .focusColor
                                            .withOpacity(0.2),
                                        selected: true,
                                        shape: StadiumBorder(
                                            side: BorderSide(
                                                color: Theme.of(context)
                                                    .focusColor
                                                    .withOpacity(0.05))),
                                        onSelected: (bool value) {
                                          // setState(() {
                                          //   size.selected = value;
                                          // });
                                        },
                                      ),
                                    )
                                  ],
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.quantity = this
                                          .decrementQuantity(widget.quantity);
                                    });
                                  },
                                  iconSize: 30,
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  icon: Icon(Icons.remove_circle_outline),
                                  color: Theme.of(context).hintColor,
                                ),
                                Text(widget.quantity.toString(),
                                    style: Theme.of(context).textTheme.subhead),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.quantity = this
                                          .incrementQuantity(widget.quantity);
                                    });
                                  },
                                  iconSize: 30,
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  icon: Icon(Icons.add_circle_outline),
                                  color: Theme.of(context).hintColor,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  incrementQuantity(int quantity) {
    if (quantity <= 99) {
      return ++quantity;
    } else {
      return quantity;
    }
  }

  decrementQuantity(int quantity) {
    if (quantity > 1) {
      return --quantity;
    } else {
      return quantity;
    }
  }
}
