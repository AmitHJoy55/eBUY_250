import 'package:flutter/material.dart';

class NotificationItem {
  final String title;
  final String message;
  final String time;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
  });
}

class NotificationPage extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Order Update',
      message: 'Your order has been shipped!',
      time: '10:30 AM',
    ),
    NotificationItem(
      title: 'New Message',
      message: 'You have a new message from a customer.',
      time: '10:32 AM',
    ),
    // Add more notifications as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index].title),
            subtitle: Text(notifications[index].message),
            trailing: Text(notifications[index].time),
            onTap: () {
              // Add navigation to detailed notification page or other actions
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailedNotificationPage(notification: notifications[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailedNotificationPage extends StatelessWidget {
  final NotificationItem notification;

  DetailedNotificationPage({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detailed Notification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' ${notification.title}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Message: ${notification.message}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Time: ${notification.time}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

