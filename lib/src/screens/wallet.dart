import 'package:flutter/material.dart';
import 'package:store_app/config/ui_icons.dart';
import 'package:store_app/src/widgets/ShoppingCartButtonWidget.dart';
import 'package:store_app/src/widgets/WalletCardWidget.dart';
import 'package:store_app/src/widgets/WalletHomeTabWidget.dart';
import 'package:store_app/src/widgets/WalletTransactionWidget.dart';
// import '../models/route_argument.dart';

class WalletWidget extends StatefulWidget {
  @override
  _WalletWidgetState createState() => _WalletWidgetState();
}

class _WalletWidgetState extends State<WalletWidget> with SingleTickerProviderStateMixin{
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _tabIndex = 0;

  @override
  void initState() {
    _tabController =
        TabController(length: 3, initialIndex: _tabIndex, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _tabIndex = _tabController.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: new IconButton(
            icon:
            new Icon(UiIcons.return_icon, color: Theme.of(context).hintColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Wallet',
            style: Theme.of(context).textTheme.display1,
          ),
          actions: <Widget>[
            // new ShoppingCartButtonWidget(
            //     iconColor: Theme.of(context).hintColor,
            //     labelColor: Theme.of(context).accentColor),
            Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(300),
                  onTap: () {
                    Navigator.of(context).pushNamed('/Tabs', arguments: 1);
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage('img/user2.jpg'),
                  ),
                )),
          ],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label ,
            labelColor: Theme.of(context).hintColor,
            tabs: <Widget>[
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        "Wallet",
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        "Transactions",
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                        "Cards",
                        style: Theme.of(context).textTheme.title,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // selectedItemColor: Theme.of(context).accentColor,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 22,
          elevation: 0,
          backgroundColor: Colors.transparent,
          // selectedIconTheme: IconThemeData(size: 25),
          unselectedItemColor: Theme.of(context).hintColor.withOpacity(1),
          // currentIndex: widget.selectedTab,
          onTap: (int i) {
            Navigator.of(context).pushNamed('/Tabs', arguments: i);
          },
          // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: Icon(UiIcons.bell),
              title: new Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(UiIcons.user_1),
              title: new Container(height: 0.0),
            ),
            BottomNavigationBarItem(
                title: new Container(height: 5.0),
                icon: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).accentColor.withOpacity(0.4),
                          blurRadius: 40,
                          offset: Offset(0, 15)),
                      BoxShadow(
                          color: Theme.of(context).accentColor.withOpacity(0.4),
                          blurRadius: 13,
                          offset: Offset(0, 3))
                    ],
                  ),
                  child: new Icon(UiIcons.home,
                      color: Theme.of(context).primaryColor),
                )),
            BottomNavigationBarItem(
              icon: new Icon(UiIcons.chat),
              title: new Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: new Icon(UiIcons.heart),
              title: new Container(height: 0.0),
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Offstage(
                  offstage: 0 != _tabIndex,
                  child: Column(
                    children: <Widget>[
                      WalletHomeTabWidget()
                    ],
                  ),
                ),
                Offstage(
                  offstage: 1 != _tabIndex,
                  child: Column(
                    children: <Widget>[
                      WalletTransactionWidget(),
                    ],
                  ),
                ),
                Offstage(
                  offstage: 2 != _tabIndex,
                  child: Column(
                    children: <Widget>[
                      WalletCardWidget(),
                    ],
                  ),
                ),
              ]
              ),
            )
          ],
        )

      ),
    );
  }
}

