import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/provider/address_provider.dart';

import '../screens/edit_address_screen.dart';

class UserAddressItem extends StatelessWidget {
  final String id;
  final String fullName;
  final String phone;
  final String streetAddress1;
  final String streetAddress2;
  final String city;
  final String state;
  final double postalcode;

  UserAddressItem(this.id, this.fullName, this.phone, this.streetAddress1,
      this.streetAddress2, this.city, this.state, this.postalcode);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                fullName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                phone.toString(),
              ),
              Text(streetAddress1),
              Text(streetAddress2),
              Text(city),
              Text(state),
              Text(postalcode.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          EditAddressScreen.routeName,
                          arguments: id);
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Provider.of<AddressProvider>(context, listen: false)
                          .deleteAddress(id);
                    },
                    child: Text(
                      'Delete',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      //title: Text(fullName),
    );
  }
}
