import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import '../../config/timeAgo.dart';
import '../models/notification.dart' as model;
import '../widgets/EmptyNotificationsWidget.dart';
import '../widgets/NotificationItemWidget.dart';
import '../widgets/SearchBarWidget.dart';

class NotificationsWidget extends StatefulWidget {
  final Future<void> Function(int, String, String) showNotification;
  NotificationsWidget(this.showNotification);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  model.NotificationList _notificationList;
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://e84b88a151e1.ngrok.io/ws/notifications/'),
  );
  @override
  void initState() {
    this._notificationList = new model.NotificationList();
    super.initState();
  }

  DateTime formatTime(String time) {
    var _date = time.split(" ");
    int year = int.parse(_date[2]);
    int month = 6; // change
    int day = int.parse(_date[1]);

    var _time = _date[3].split(":");
    int hour = int.parse(_time[0]);
    int min = int.parse(_time[1]);
    int sec = int.parse(_time[2]);

    DateTime _notifTime = DateTime(
      year,
      month,
      day,
      hour,
      min,
      sec,
    );

    return _notifTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 7),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchBarWidget(),
            ),
            Offstage(
              offstage: _notificationList.notifications.isEmpty,
              child: StreamBuilder(
                stream: _channel.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final item = jsonDecode(snapshot.data);
                    // print(item);

                    _notificationList.notifications.add(item.forEach(
                      (value) => model.Notification.fromMap(value),
                    ));
                    // _notificationList.notifications.contains()
                    print(_notificationList);
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: _notificationList.notifications.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 7);
                      },
                      itemBuilder: (context, index) {
                        final _notif = item[index];
                        widget.showNotification(
                          _notif['id'] as int,
                          _notif['title'],
                          _notif['description'] + _notif['description_hi'],
                        );

                        // widget.showNotification(
                        //   _notif['id'] as int,
                        //   _notif['title_hi'],
                        //   _notif['description_hi'],
                        // );
                        print(_notif);
                        return NotificationItemWidget(
                          notification: model.Notification(
                            id: _notif['id'],
                            image: _notif['image'] ?? '',
                            title: _notif['title'],
                            title_hi: _notif['title_hi'],
                            time: TimeAgo.timeAgoSinceDate(
                                formatTime(_notif['datetime'])),
                            read: false,
                          ),
                          onDismissed: (notification) {
                            setState(() {
                              _notificationList.notifications.removeAt(index);
                            });
                          },
                        );
                      },
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Offstage(
              offstage: _notificationList.notifications.isNotEmpty,
              child: EmptyNotificationsWidget(),
            )
          ],
        ),
      ),
    );
  }
}
