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
              avatar: 'img/temp/group_icon.jpeg',
              userState: UserState.available),
<<<<<<< Updated upstream
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
=======
          chats: [
            new Chat(
                text: 'Yeah that\'d be a nice idea',
                time: '63min ago',
                user: new User.basic(
                    firstName: 'Raghav',
                    lastName: 'Shukla',
                    avatar: 'img/temp/Raghav.jpeg',
                    userState: UserState.available)),
            new Chat(
                text: 'Nice, I think you should go for Redmi Note 8',
                time: '15min ago',
                user: _currentUser),
            new Chat(
                text: 'I was looking forward to buy a new phone..',
                time: '16min ago',
                user: new User.basic(
                    firstName: 'Raghav',
                    lastName: 'Shukla',
                    avatar: 'img/temp/Raghav.jpeg',
>>>>>>> Stashed changes
                    userState: UserState.available))
          ],
          false),
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
<<<<<<< Updated upstream
          [
            new Chat(
                'Flutter project, add the following dependency ',
                '32min ago',
                new User.basic(
=======
          chats: [
            new Chat(
                text: 'Flutter project, add the following dependency ',
                time: '32min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
<<<<<<< Updated upstream
                'Can scroll in any direction. ', '42min ago', _currentUser),
            new Chat(
                'Notifies when the header scrolls outside the viewport. ',
                '12min ago',
                new User.basic(
=======
                text: 'Can scroll in any direction. ',
                time: '42min ago',
                user: _currentUser),
            new Chat(
                text: 'Notifies when the header scrolls outside the viewport. ',
                time: '12min ago',
                user: new User.basic(
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
          [
            new Chat(
                'Accepts one sliver as content. ',
                '1day ago',
                new User.basic(
=======
          chats: [
            new Chat(
                text: 'Accepts one sliver as content. ',
                time: '1day ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
<<<<<<< Updated upstream
            new Chat('Yes, Ok', '6min ago', _currentUser),
            new Chat(
                'Notifies when the header scrolls outside the viewport.  ',
                '33min ago',
                new User.basic(
=======
            new Chat(text: 'Yes, Ok', time: '6min ago', user: _currentUser),
            new Chat(
                text:
                    'Notifies when the header scrolls outside the viewport.  ',
                time: '33min ago',
                user: new User.basic(
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
          [
            new Chat(
                'Can scroll in any direction. ',
                '63min ago',
                new User.basic(
=======
          chats: [
            new Chat(
                text: 'Can scroll in any direction. ',
                time: '63min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
<<<<<<< Updated upstream
                'Can scroll in any direction. ',
                '1hour ago',
                new User.basic(
=======
                text: 'Can scroll in any direction. ',
                time: '1hour ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
<<<<<<< Updated upstream
            new Chat('Supports overlapping (AppBars for example).', '33min ago',
                _currentUser)
=======
            new Chat(
                text: 'Supports overlapping (AppBars for example).',
                time: '33min ago',
                user: _currentUser)
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                'Accepts one sliver as content. ',
                '43min ago',
                new User.basic(
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          false),
=======
                text: 'Supports overlapping (AppBars for example). ',
                time: '31min ago',
                user: _currentUser),
            new Chat(
              text: 'Accepts one sliver as content. ',
              time: '43min ago',
              user: new User.basic(
                  firstName: 'Jordan',
                  lastName: 'P. Jeffries',
                  avatar: 'img/user1.jpg',
                  userState: UserState.available),
            )
          ],
          read: false),
>>>>>>> Stashed changes
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
<<<<<<< Updated upstream
          [
            new Chat(
                'Accepts one sliver as content.',
                '45min ago',
                new User.basic(
=======
          chats: [
            new Chat(
                text: 'Accepts one sliver as content.',
                time: '45min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
<<<<<<< Updated upstream
            new Chat('Supports overlapping (AppBars for example).', '12min ago',
                _currentUser),
            new Chat(
                'Can scroll in any direction. ',
                '31min ago',
                new User.basic(
=======
            new Chat(
                text: 'Supports overlapping (AppBars for example).',
                time: '12min ago',
                user: _currentUser),
            new Chat(
                text: 'Can scroll in any direction. ',
                time: '31min ago',
                user: new User.basic(
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
          [
            new Chat(
                'Can scroll in any direction.  ',
                '33min ago',
                User.basic(
=======
          chats: [
            new Chat(
                text: 'Can scroll in any direction.  ',
                time: '33min ago',
                user: User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
<<<<<<< Updated upstream
            new Chat('Supports overlapping (AppBars for example). ',
                '33min ago', _currentUser),
            new Chat(
                'Accepts one sliver as content. ',
                '33min ago',
                new User.basic(
=======
            new Chat(
                text: 'Supports overlapping (AppBars for example). ',
                time: '33min ago',
                user: _currentUser),
            new Chat(
                text: 'Accepts one sliver as content. ',
                time: '33min ago',
                user: new User.basic(
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
          [
            new Chat(
                'Supports overlapping AppBars for example. ',
                '33min ago',
                new User.basic(
=======
          chats: [
            new Chat(
                text: 'Supports overlapping AppBars for example. ',
                time: '33min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
<<<<<<< Updated upstream
                'Can scroll in any direction.  ', '33min ago', _currentUser),
            new Chat(
                'For help getting started with Flutter ',
                '33min ago',
                new User.basic(
=======
                text: 'Can scroll in any direction.  ',
                time: '33min ago',
                user: _currentUser),
            new Chat(
                text: 'For help getting started with Flutter ',
                time: '33min ago',
                user: new User.basic(
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
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
=======
          user: new User.basic(
              firstName: 'Delhi',
              lastName: 'Wholesalers',
              avatar: 'img/temp/group_icon.jpeg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Yeah that\'d be a nice idea',
                time: '63min ago',
                user: new User.basic(
                    firstName: 'Raghav',
                    lastName: 'Shukla',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Nice, I think you should go for Redmi Note 8',
                time: '15min ago',
                user: _currentUser),
            new Chat(
                text: 'I was looking forward to buy a new phone..',
                time: '16min ago',
                user: new User.basic(
                    firstName: 'Raghav',
                    lastName: 'Shukla',
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
          [
            new Chat(
                'Flutter project, add the following dependency ',
                '32min ago',
                new User.basic(
=======
          chats: [
            new Chat(
                text: 'Flutter project, add the following dependency ',
                time: '32min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
<<<<<<< Updated upstream
                'Can scroll in any direction. ', '42min ago', _currentUser),
            new Chat(
                'Notifies when the header scrolls outside the viewport. ',
                '12min ago',
                new User.basic(
=======
                text: 'Can scroll in any direction. ',
                time: '42min ago',
                user: _currentUser),
            new Chat(
                text: 'Notifies when the header scrolls outside the viewport. ',
                time: '12min ago',
                user: new User.basic(
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
          [
            new Chat(
                'Accepts one sliver as content. ',
                '1day ago',
                new User.basic(
=======
          chats: [
            new Chat(
                text: 'Accepts one sliver as content. ',
                time: '1day ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
<<<<<<< Updated upstream
            new Chat('Yes, Ok', '6min ago', _currentUser),
            new Chat(
                'Notifies when the header scrolls outside the viewport.  ',
                '33min ago',
                new User.basic(
=======
            new Chat(text: 'Yes, Ok', time: '6min ago', user: _currentUser),
            new Chat(
                text:
                    'Notifies when the header scrolls outside the viewport.  ',
                time: '33min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
<<<<<<< Updated upstream
          true),
=======
          read: true),
>>>>>>> Stashed changes
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
<<<<<<< Updated upstream
          [
            new Chat(
                'For help getting started with Flutter ',
                '31min ago',
                new User.basic(
=======
          chats: [
            new Chat(
                text: 'For help getting started with Flutter ',
                time: '31min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
<<<<<<< Updated upstream
            new Chat('Supports overlapping (AppBars for example). ',
                '31min ago', _currentUser),
            new Chat(
                'Accepts one sliver as content. ',
                '43min ago',
                new User.basic(
=======
            new Chat(
                text: 'Supports overlapping (AppBars for example). ',
                time: '31min ago',
                user: _currentUser),
            new Chat(
                text: 'Accepts one sliver as content. ',
                time: '43min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
<<<<<<< Updated upstream
          false),
=======
          read: false),
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
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
=======
          user: new User.basic(
              firstName: 'Vinay',
              lastName: 'Sharma',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
          chats: [
            new Chat(
                text: 'Yeah that\'d be a nice idea',
                time: '63min ago',
                user: new User.basic(
                    firstName: 'Raghav',
                    lastName: 'Shukla',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
                text: 'Nice, I think you should go for Redmi Note 8',
                time: '15min ago',
                user: _currentUser),
            new Chat(
                text: 'I was looking forward to buy a new phone..',
                time: '16min ago',
                user: new User.basic(
                    firstName: 'Raghav',
                    lastName: 'Shukla',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
          read: false),
>>>>>>> Stashed changes
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
<<<<<<< Updated upstream
          [
            new Chat(
                'Flutter project, add the following dependency ',
                '32min ago',
                new User.basic(
=======
          chats: [
            new Chat(
                text: 'Flutter project, add the following dependency ',
                time: '32min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
<<<<<<< Updated upstream
                'Can scroll in any direction. ', '42min ago', _currentUser),
            new Chat(
                'Notifies when the header scrolls outside the viewport. ',
                '12min ago',
                new User.basic(
=======
                text: 'Can scroll in any direction. ',
                time: '42min ago',
                user: _currentUser),
            new Chat(
                text: 'Notifies when the header scrolls outside the viewport. ',
                time: '12min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
<<<<<<< Updated upstream
          true),
=======
          read: true),
>>>>>>> Stashed changes
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
<<<<<<< Updated upstream
          [
            new Chat(
                'Accepts one sliver as content. ',
                '1day ago',
                new User.basic(
=======
          chats: [
            new Chat(
                text: 'Accepts one sliver as content. ',
                time: '1day ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
<<<<<<< Updated upstream
            new Chat('Yes, Ok', '6min ago', _currentUser),
            new Chat(
                'Notifies when the header scrolls outside the viewport.  ',
                '33min ago',
                new User.basic(
=======
            new Chat(text: 'Yes, Ok', time: '6min ago', user: _currentUser),
            new Chat(
                text:
                    'Notifies when the header scrolls outside the viewport.  ',
                time: '33min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
<<<<<<< Updated upstream
          true),
=======
          read: true),
>>>>>>> Stashed changes
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
<<<<<<< Updated upstream
          [
            new Chat(
                'Can scroll in any direction. ',
                '63min ago',
                new User.basic(
=======
          chats: [
            new Chat(
                text: 'Can scroll in any direction. ',
                time: '63min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
<<<<<<< Updated upstream
                'Can scroll in any direction. ',
                '1hour ago',
                new User.basic(
=======
                text: 'Can scroll in any direction. ',
                time: '1hour ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
<<<<<<< Updated upstream
            new Chat('Supports overlapping (AppBars for example).', '33min ago',
                _currentUser)
          ],
          true),
=======
            new Chat(
                text: 'Supports overlapping (AppBars for example).',
                time: '33min ago',
                user: _currentUser)
          ],
          read: true),
>>>>>>> Stashed changes
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
<<<<<<< Updated upstream
          [
            new Chat(
                'For help getting started with Flutter ',
                '31min ago',
                new User.basic(
=======
          chats: [
            new Chat(
                text: 'For help getting started with Flutter ',
                time: '31min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
<<<<<<< Updated upstream
            new Chat('Supports overlapping (AppBars for example). ',
                '31min ago', _currentUser),
            new Chat(
                'Accepts one sliver as content. ',
                '43min ago',
                new User.basic(
=======
            new Chat(
                text: 'Supports overlapping (AppBars for example). ',
                time: '31min ago',
                user: _currentUser),
            new Chat(
                text: 'Accepts one sliver as content. ',
                time: '43min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
<<<<<<< Updated upstream
          false),
=======
          read: false),
>>>>>>> Stashed changes
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
<<<<<<< Updated upstream
          [
            new Chat(
                'Accepts one sliver as content.',
                '45min ago',
                new User.basic(
=======
          chats: [
            new Chat(
                text: 'Accepts one sliver as content.',
                time: '45min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
<<<<<<< Updated upstream
            new Chat('Supports overlapping (AppBars for example).', '12min ago',
                _currentUser),
            new Chat(
                'Can scroll in any direction. ',
                '31min ago',
                new User.basic(
=======
            new Chat(
                text: 'Supports overlapping (AppBars for example).',
                time: '12min ago',
                user: _currentUser),
            new Chat(
                text: 'Can scroll in any direction. ',
                time: '31min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available))
          ],
<<<<<<< Updated upstream
          false),
=======
          read: false),
>>>>>>> Stashed changes
      new Conversation(
          new User.basic(
              firstName: 'Maria',
              lastName: 'R. Garza',
              avatar: 'img/user0.jpg',
              userState: UserState.available),
<<<<<<< Updated upstream
          [
            new Chat(
                'Can scroll in any direction.  ',
                '33min ago',
                new User.basic(
=======
          chats: [
            new Chat(
                text: 'Can scroll in any direction.  ',
                time: '33min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
<<<<<<< Updated upstream
            new Chat('Supports overlapping (AppBars for example). ',
                '33min ago', _currentUser),
            new Chat(
                'Accepts one sliver as content. ',
                '33min ago',
                new User.basic(
=======
            new Chat(
                text: 'Supports overlapping (AppBars for example). ',
                time: '33min ago',
                user: _currentUser),
            new Chat(
                text: 'Accepts one sliver as content. ',
                time: '33min ago',
                user: new User.basic(
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
          [
            new Chat(
                'Supports overlapping AppBars for example. ',
                '33min ago',
                new User.basic(
=======
          chats: [
            new Chat(
                text: 'Supports overlapping AppBars for example. ',
                time: '33min ago',
                user: new User.basic(
>>>>>>> Stashed changes
                    firstName: 'Maria',
                    lastName: 'R. Garza',
                    avatar: 'img/user0.jpg',
                    userState: UserState.available)),
            new Chat(
<<<<<<< Updated upstream
                'Can scroll in any direction.  ', '33min ago', _currentUser),
            new Chat(
                'For help getting started with Flutter ',
                '33min ago',
                new User.basic(
=======
                text: 'Can scroll in any direction.  ',
                time: '33min ago',
                user: _currentUser),
            new Chat(
                text: 'For help getting started with Flutter ',
                time: '33min ago',
                user: new User.basic(
>>>>>>> Stashed changes
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
