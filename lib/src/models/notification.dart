class Notification {
  String image;
  String title;
  String time;
  bool read;

  Notification({this.image, this.title, this.time, this.read});
}

class NotificationList {
  List<Notification> _notifications;

  NotificationList() {
    this._notifications = [
      new Notification(
          image: 'img/man1.webp',
          title:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
          time: '33min ago',
          read: false),
      new Notification(
          image: 'img/home4.webp',
          title:
              'It is a long established fact that a reader will be distracted',
          time: '32min ago',
          read: true),
      new Notification(
          image: 'img/sport1.webp',
          title:
              'There are many variations of passages of Lorem Ipsum available',
          time: '34min ago',
          read: true),
      new Notification(
          image: 'img/man3.webp',
          title:
              'Contrary to popular belief, Lorem Ipsum is not simply random text',
          time: '52min ago',
          read: true),
      new Notification(
          image: 'img/pro1.webp',
          title:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
          time: '10min ago',
          read: false),
      new Notification(
          image: 'img/user0.jpg',
          title:
              'It is a long established fact that a reader will be distracted',
          time: '12min ago',
          read: false),
      new Notification(
          image: 'img/man5.webp',
          title:
              'There are many variations of passages of Lorem Ipsum available',
          time: '2 hours ago',
          read: true),
      new Notification(
          image: 'img/baby2.webp',
          title:
              'Contrary to popular belief, Lorem Ipsum is not simply random text',
          time: '1 day ago',
          read: false),
    ];
  }

  List<Notification> get notifications => _notifications;
}
