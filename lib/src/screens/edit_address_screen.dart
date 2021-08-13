import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/ui_icons.dart';
import 'package:store_app/provider/address_provider.dart';

import '../models/address.dart';

class EditAddressScreen extends StatefulWidget {
  static const routeName = '/edit-address';

  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final _phoneFocusNode = FocusNode();
  final _streetAddress1FocusNode = FocusNode();
  final _streetAddress2FocusNode = FocusNode();
  final _cityFocusNode = FocusNode();
  final _stateFocusNode = FocusNode();
  final _postalcodeFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedAddress = Address(
    id: null,
    fullName: '',
    phone: 0,
    streetAddress1: '',
    streetAddress2: '',
    city: '',
    state: '',
    postalcode: 0,
  );
  var _initValues = {
    'fullName': '',
    'phone': '',
    'streetAddress1': '',
    'streetAddress2': '',
    'city': '',
    'state': '',
    'postalcode': '',
  };
  var _isInit = true;

  @override
  void initState() {
    // _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final addressId = ModalRoute.of(context).settings.arguments as String;
      if (addressId != null) {
        _editedAddress = Provider.of<AddressProvider>(context, listen: false)
            .findById(addressId);
        _initValues = {
          'fullName': _editedAddress.fullName,
          'phone': _editedAddress.phone.toString(),
          'streetAddress1': _editedAddress.streetAddress1,
          'streetAddress2': _editedAddress.streetAddress2,
          'city': _editedAddress.city,
          'state': _editedAddress.state,
          'postalcode': _editedAddress.postalcode.toString(),
        };
        //_imageUrlController.text = _editedProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _streetAddress1FocusNode.dispose();
    _streetAddress2FocusNode.dispose();
    _cityFocusNode.dispose();
    _stateFocusNode.dispose();
    _postalcodeFocusNode.dispose();

    super.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    if (_editedAddress.id != null) {
      Provider.of<AddressProvider>(context, listen: false)
          .updateAddress(_editedAddress.id, _editedAddress);
    } else {
      Provider.of<AddressProvider>(context, listen: false)
          .addAddress(_editedAddress);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Address'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _initValues['fullName'],
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  hintStyle: Theme.of(context).textTheme.bodyText2.merge(
                        TextStyle(color: Theme.of(context).accentColor),
                      ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).accentColor.withOpacity(0.2))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor)),
                  prefixIcon: Icon(
                    UiIcons.user_2,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_phoneFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Full Name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedAddress = Address(
                      id: _editedAddress.id,
                      fullName: value,
                      phone: _editedAddress.phone,
                      streetAddress1: _editedAddress.streetAddress1,
                      streetAddress2: _editedAddress.streetAddress2,
                      city: _editedAddress.city,
                      state: _editedAddress.state,
                      postalcode: _editedAddress.postalcode);
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                initialValue: _initValues['phone'],
                decoration: InputDecoration(
                  hintText: 'Phone',
                  hintStyle: Theme.of(context).textTheme.bodyText2.merge(
                        TextStyle(color: Theme.of(context).accentColor),
                      ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).accentColor.withOpacity(0.2))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor)),
                  prefixIcon: Icon(
                    UiIcons.smartphone,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                focusNode: _phoneFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_streetAddress1FocusNode);
                },
                validator: (value) {
                  final numericRegex =
                      RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
                  if (value.length != 10 || !numericRegex.hasMatch(value)) {
                    return "Enter correct Mobile Number";
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedAddress = Address(
                      id: _editedAddress.id,
                      fullName: _editedAddress.fullName,
                      phone: double.parse(value),
                      streetAddress1: _editedAddress.streetAddress1,
                      streetAddress2: _editedAddress.streetAddress2,
                      city: _editedAddress.city,
                      state: _editedAddress.state,
                      postalcode: _editedAddress.postalcode);
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                initialValue: _initValues['streetAddress1'],
                decoration: InputDecoration(
                  hintText: 'House No.,Building Name',
                  hintStyle: Theme.of(context).textTheme.bodyText2.merge(
                        TextStyle(color: Theme.of(context).accentColor),
                      ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).accentColor.withOpacity(0.2))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor)),
                  prefixIcon: Icon(
                    UiIcons.smartphone,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                textInputAction: TextInputAction.next,
                //keyboardType: TextInputType.text,
                focusNode: _streetAddress1FocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_streetAddress2FocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter House No.,Building Name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedAddress = Address(
                      id: _editedAddress.id,
                      fullName: _editedAddress.fullName,
                      phone: _editedAddress.phone,
                      streetAddress1: value,
                      streetAddress2: _editedAddress.streetAddress2,
                      city: _editedAddress.city,
                      state: _editedAddress.state,
                      postalcode: _editedAddress.postalcode);
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                initialValue: _initValues['streetAddress2'],
                decoration: InputDecoration(
                  hintText: 'Street Name/Area Name/Colony Name',
                  hintStyle: Theme.of(context).textTheme.bodyText2.merge(
                        TextStyle(color: Theme.of(context).accentColor),
                      ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).accentColor.withOpacity(0.2))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor)),
                  prefixIcon: Icon(
                    UiIcons.smartphone,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                textInputAction: TextInputAction.next,
                //keyboardType: TextInputType.number,
                focusNode: _streetAddress2FocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_cityFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Street Name/Area Name/Colony Name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedAddress = Address(
                      id: _editedAddress.id,
                      fullName: _editedAddress.fullName,
                      phone: _editedAddress.phone,
                      streetAddress1: _editedAddress.streetAddress1,
                      streetAddress2: value,
                      city: _editedAddress.city,
                      state: _editedAddress.state,
                      postalcode: _editedAddress.postalcode);
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                initialValue: _initValues['city'],
                decoration: InputDecoration(
                  hintText: 'Enter City/District',
                  hintStyle: Theme.of(context).textTheme.bodyText2.merge(
                        TextStyle(color: Theme.of(context).accentColor),
                      ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).accentColor.withOpacity(0.2))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor)),
                  prefixIcon: Icon(
                    UiIcons.smartphone,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                textInputAction: TextInputAction.next,
                //keyboardType: TextInputType.number,
                focusNode: _cityFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_stateFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter City/District';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedAddress = Address(
                      id: _editedAddress.id,
                      fullName: _editedAddress.fullName,
                      phone: _editedAddress.phone,
                      streetAddress1: _editedAddress.streetAddress1,
                      streetAddress2: _editedAddress.streetAddress2,
                      city: value,
                      state: _editedAddress.state,
                      postalcode: _editedAddress.postalcode);
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                initialValue: _initValues['state'],
                decoration: InputDecoration(
                  hintText: 'State',
                  hintStyle: Theme.of(context).textTheme.bodyText2.merge(
                        TextStyle(color: Theme.of(context).accentColor),
                      ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).accentColor.withOpacity(0.2))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor)),
                  prefixIcon: Icon(
                    UiIcons.smartphone,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                textInputAction: TextInputAction.next,
                //keyboardType: TextInputType.number,
                focusNode: _stateFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_postalcodeFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter State';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedAddress = Address(
                      id: _editedAddress.id,
                      fullName: _editedAddress.fullName,
                      phone: _editedAddress.phone,
                      streetAddress1: _editedAddress.streetAddress1,
                      streetAddress2: _editedAddress.streetAddress2,
                      city: _editedAddress.city,
                      state: value,
                      postalcode: _editedAddress.postalcode);
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                initialValue: _initValues['postalcode'],
                decoration: InputDecoration(
                  hintText: 'Postal Code(6 Digit)',
                  hintStyle: Theme.of(context).textTheme.bodyText2.merge(
                        TextStyle(color: Theme.of(context).accentColor),
                      ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).accentColor.withOpacity(0.2))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor)),
                  prefixIcon: Icon(
                    UiIcons.smartphone,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _postalcodeFocusNode,
                onFieldSubmitted: (_) {
                  _saveForm();
                },
                validator: (value) {
                  final numericRegex =
                      RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
                  if (value.length != 6 || !numericRegex.hasMatch(value)) {
                    return "Enter correct Postal Code";
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedAddress = Address(
                      id: _editedAddress.id,
                      fullName: _editedAddress.fullName,
                      phone: _editedAddress.phone,
                      streetAddress1: _editedAddress.streetAddress1,
                      streetAddress2: _editedAddress.streetAddress2,
                      city: _editedAddress.city,
                      state: _editedAddress.state,
                      postalcode: double.parse(value));
                },
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 70),
                    onPressed: _saveForm,
                    child: Text(
                      'Save Address',
                      style: Theme.of(context).textTheme.title.merge(
                            TextStyle(color: Theme.of(context).backgroundColor),
                          ),
                    ),
                    color: Theme.of(context).accentColor,
                    shape: StadiumBorder(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
