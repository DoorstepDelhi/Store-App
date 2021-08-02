import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/provider/getit.dart';
import 'package:store_app/src/models/user.dart';

class Prefs {
  final String _userIDStorageKey = 'USER_ID';
  final String _authTokenStorageKey = 'AUTH_TOKEN';
  final String _userName = 'USERNAME';
  final String _firstName = 'FIRSTNAME';
  final String _lastName = 'LASTNAME';
  final String _profilePic = 'PROFILEPIC';
  final String _languageStorageKey = 'LANGUAGE';
  final String _voiceNotificationStorageKey = 'VOICE_NOTIF';

  Future<void> setUser(
      {String token,
      String uid,
      String username,
      String firstName,
      String lastName,
      String profilePic}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = getIt.get<User>();
    user.username = username;
    user.id = uid;
    user.token = token;
    user.firstName = firstName;
    user.lastName = lastName;
    user.avatar = profilePic;
    user.userState = UserState.available;
    prefs.setString(_userName, username);
    prefs.setString(_userIDStorageKey, uid);
    prefs.setString(_authTokenStorageKey, token);
    prefs.setString(_firstName, firstName);
    prefs.setString(_lastName, lastName);
    prefs.setString(_profilePic, profilePic);
  }

  Future<void> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = getIt.get<User>();
    user.username = prefs.getString(_userName);
    user.id = prefs.getString(_userIDStorageKey);
    user.token = prefs.getString(_authTokenStorageKey);
    user.firstName = prefs.getString(_firstName);
    user.lastName = prefs.getString(_lastName);
    user.avatar = prefs.getString(_profilePic);
    user.userState = UserState.available;
  }

  Future<String> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageStorageKey) ?? 'English';
  }

  Future<void> setLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_languageStorageKey, language);
  }

  Future<bool> getVoiceNotification() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_voiceNotificationStorageKey) ?? true;
  }

  Future<void> setVoiceNotification(bool selected) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_voiceNotificationStorageKey, selected);
  }
}
