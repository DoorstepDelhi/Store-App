import 'package:flutter/material.dart';
import 'package:store_app/src/models/product.dart';
import 'package:store_app/src/models/route_argument.dart';

// ignore: must_be_immutable
class ProductsListViewWidget extends StatefulWidget {
  String heroTag;
  Product product;

  ProductsListViewWidget({this.heroTag, this.product});

  @override
  _ProductsListViewWidgetState createState() => _ProductsListViewWidgetState();
}

class _ProductsListViewWidgetState extends State<ProductsListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      focusColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).primaryColor,
      onTap: () {
        //check
        Navigator.of(context).pushNamed(
          '/Product',
          arguments: new RouteArgument(
              argumentsList: [this.widget.product, this.widget.heroTag],
              id: this.widget.product.id),
        );
      },
      child: Container(
        // height: 100,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.9),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).focusColor.withOpacity(0.1),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: widget.heroTag + widget.product.id,
              child: Container(
                height: 60,
                width: 60,
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
                        Row(
                          children: <Widget>[
                            // The title of the product
                            Text(
                              '${widget.product.quantity} quantity',
                              style: Theme.of(context).textTheme.body1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Text(
                              widget.product.rate.toString(),
                              style: Theme.of(context).textTheme.body2,
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(widget.product.getPrice(),
                      style: Theme.of(context).textTheme.display1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
