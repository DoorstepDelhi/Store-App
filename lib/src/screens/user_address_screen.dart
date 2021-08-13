import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/provider/address_provider.dart';

import '../widgets/user_address_item.dart';
import './edit_address_screen.dart';
import '../widgets/DrawerWidget.dart';
import '../widgets/ShoppingCartButtonWidget.dart';

class UserAddressScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  static const routeName = '/user-address';
  @override
  Widget build(BuildContext context) {
    final addressData = Provider.of<AddressProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
//        leading: new IconButton(
//          icon: new Icon(UiIcons.return_icon, color: Theme.of(context).hintColor),
//          onPressed: () => Navigator.of(context).pop(),
//        ),
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Address',
          style: Theme.of(context).textTheme.display1,
        ),
        actions: <Widget>[
          new ShoppingCartButtonWidget(
              iconColor: Theme.of(context).hintColor,
              labelColor: Theme.of(context).accentColor),
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
      ),
      /*appBar: AppBar(
          title: const Text('Your Address'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditAddressScreen.routeName);
              },
              icon: Icon(Icons.add),
            )
          ],
        ),*/
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: addressData.items.length,
          itemBuilder: (_, i) => Column(
            children: [
              UserAddressItem(
                  addressData.items[i].id,
                  addressData.items[i].fullName,
                  addressData.items[i].phone.toString(),
                  addressData.items[i].streetAddress1,
                  addressData.items[i].streetAddress2,
                  addressData.items[i].city,
                  addressData.items[i].state,
                  addressData.items[i].postalcode),
              Divider(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        //icon: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(EditAddressScreen.routeName);
        },
        label: Text('Add New Address'),
      ),
    );
  }
}
