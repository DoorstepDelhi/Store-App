import './chat.dart';
import './user.dart';
import 'package:flutter/material.dart';

class Conversation {
  String id = UniqueKey().toString();
  List<Chat> chats;
  bool read;
  User user;

  Conversation(this.user, this.chats, this.read);
}

class ConversationsList {
  List<Conversation> _conversations;
  User _currentUser = new User.init().getCurrentUser();

  ConversationsList() {
    this._conversations = [
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Supports overlappi',
                '63min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                'Accepts one sliver as content.', '15min ago', _currentUser),
            new Chat(
                'Header can ov',
                '16min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          false),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Flutter project, add the following dependency ',
                '32min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                'Can scroll in any direction. ', '42min ago', _currentUser),
            new Chat(
                'Notifies when the header scrolls outside the viewport. ',
                '12min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          true),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Accepts one sliver as content. ',
                '1day ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat('Yes, Ok', '6min ago', _currentUser),
            new Chat(
                'Notifies when the header scrolls outside the viewport.  ',
                '33min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          true),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Can scroll in any direction. ',
                '63min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                'Can scroll in any direction. ',
                '1hour ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat('Supports overlapping (AppBars for example).', '33min ago',
                _currentUser)
          ],
          true),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'For help getting started with Flutter ',
                '31min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat('Supports overlapping (AppBars for example). ',
                '31min ago', _currentUser),
            new Chat(
                'Accepts one sliver as content. ',
                '43min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          false),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Accepts one sliver as content.',
                '45min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat('Supports overlapping (AppBars for example).', '12min ago',
                _currentUser),
            new Chat(
                'Can scroll in any direction. ',
                '31min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          false),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Can scroll in any direction.  ',
                '33min ago',
                User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat('Supports overlapping (AppBars for example). ',
                '33min ago', _currentUser),
            new Chat(
                'Accepts one sliver as content. ',
                '33min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          true),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Supports overlapping AppBars for example. ',
                '33min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                'Can scroll in any direction.  ', '33min ago', _currentUser),
            new Chat(
                'For help getting started with Flutter ',
                '33min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          false),
    ];
  }

  List<Conversation> get conversations => _conversations;
}

class GroupConversationsList extends ConversationsList {
  List<Conversation> _conversations;
  User _currentUser = new User.init().getCurrentUser();

  GroupConversationsList() {
    this._conversations = [
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Supports overlappi',
                '63min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                'Accepts one sliver as content.', '15min ago', _currentUser),
            new Chat(
                'Header can ov',
                '16min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          false),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Flutter project, add the following dependency ',
                '32min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                'Can scroll in any direction. ', '42min ago', _currentUser),
            new Chat(
                'Notifies when the header scrolls outside the viewport. ',
                '12min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          true),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Accepts one sliver as content. ',
                '1day ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat('Yes, Ok', '6min ago', _currentUser),
            new Chat(
                'Notifies when the header scrolls outside the viewport.  ',
                '33min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          true),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'For help getting started with Flutter ',
                '31min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat('Supports overlapping (AppBars for example). ',
                '31min ago', _currentUser),
            new Chat(
                'Accepts one sliver as content. ',
                '43min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          false),
    ];
  }

  List<Conversation> get conversations => _conversations;
}

class PeopleNearbyConversationsList extends ConversationsList {
  List<Conversation> _conversations;
  User _currentUser = new User.init().getCurrentUser();

  PeopleNearbyConversationsList() {
    this._conversations = [
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Supports overlappi',
                '63min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                'Accepts one sliver as content.', '15min ago', _currentUser),
            new Chat(
                'Header can ov',
                '16min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          false),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Flutter project, add the following dependency ',
                '32min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                'Can scroll in any direction. ', '42min ago', _currentUser),
            new Chat(
                'Notifies when the header scrolls outside the viewport. ',
                '12min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          true),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Accepts one sliver as content. ',
                '1day ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat('Yes, Ok', '6min ago', _currentUser),
            new Chat(
                'Notifies when the header scrolls outside the viewport.  ',
                '33min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          true),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Can scroll in any direction. ',
                '63min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                'Can scroll in any direction. ',
                '1hour ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat('Supports overlapping (AppBars for example).', '33min ago',
                _currentUser)
          ],
          true),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'For help getting started with Flutter ',
                '31min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat('Supports overlapping (AppBars for example). ',
                '31min ago', _currentUser),
            new Chat(
                'Accepts one sliver as content. ',
                '43min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          false),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Accepts one sliver as content.',
                '45min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat('Supports overlapping (AppBars for example).', '12min ago',
                _currentUser),
            new Chat(
                'Can scroll in any direction. ',
                '31min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          false),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Can scroll in any direction.  ',
                '33min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat('Supports overlapping (AppBars for example). ',
                '33min ago', _currentUser),
            new Chat(
                'Accepts one sliver as content. ',
                '33min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          true),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          [
            new Chat(
                'Supports overlapping AppBars for example. ',
                '33min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                'Can scroll in any direction.  ', '33min ago', _currentUser),
            new Chat(
                'For help getting started with Flutter ',
                '33min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          false),
    ];
  }

  List<Conversation> get conversations => _conversations;
}
