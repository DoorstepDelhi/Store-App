import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:store_app/provider/getit.dart';
//import 'package:intl/intl.dart' show DateFormat;

enum UserState { available, away, busy }

class User {
  String id = UniqueKey().toString();
  String username;
  String firstName;
  String lastName;
  String token;
  String email;
  String avatar;
  String address;
  UserState userState;
  String phoneNumber;

  User.init();

  User.basic(
      {this.firstName,
      this.lastName,
      this.avatar,
      this.userState,
      this.id,
      this.token,
      this.username});

  User.advanced(
      {this.firstName,
      this.lastName,
      this.email,
      this.avatar,
      this.address,
      this.userState,
      this.phoneNumber,
      this.username,
      this.token});

  User getCurrentUser() {
    final _user = getIt.get<User>();
    return User.advanced(
        firstName: _user.firstName,
        lastName: _user.lastName,
        email: _user.firstName + _user.lastName + '30@gmail.com',
        avatar: 'img/temp/Rahul.jpeg',
        address: 'B1 34, sector 69 Dwarka, Delhi',
        userState: UserState.available,
        phoneNumber: '9080789067');
  }
}
