import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/CreditCardsWidget.dart';

class WalletCardWidget extends StatefulWidget {

  @override
  _WalletCardWidgetState createState() => _WalletCardWidgetState();
}

class _WalletCardWidgetState extends State<WalletCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(height: 20.0,),
        CreditCardsWidget(),
        SizedBox(height: 20.0,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Card History',
              style: Theme.of(context).textTheme.display3,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            // color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6),

          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Theme.of(context).accentColor,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Added Money',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '14/4/21',
                          style: Theme.of(context).textTheme.overline,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '\$ 2000',
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            // color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6),

          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.shopping_bag,
                        color: Theme.of(context).accentColor,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Added Money',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '12/4/21',
                          style: Theme.of(context).textTheme.overline,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '\$ 100',
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            // color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6),

          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.shopping_bag,
                        color: Theme.of(context).accentColor,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Ordered',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '11/4/21',
                          style: Theme.of(context).textTheme.overline,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '\$ 300',
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
