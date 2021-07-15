class Notification {
  String image;
  String title;
  String time;
  bool read;

  Notification({
    this.image,
    this.title,
    this.time,
    this.read,
  });

  factory Notification.fromMap(Map<String, dynamic> map) => Notification(
        image: map['image'],
        title: map['title'],
        time: map['datetime'],
        read: false,
      );
}

class NotificationList {
  List<Notification> _notifications;

  NotificationList() {
    this._notifications = [];
  }

  List<Notification> get notifications => _notifications;
}
