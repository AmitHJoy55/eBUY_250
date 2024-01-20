import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          MessageItem(
            sender: 'Arnob Sen',
            message: 'Please, could you send me some pic of your product!',
            time: '2 hours ago',
            unread: true,
          ),
          MessageItem(
            sender: 'Moloy',
            message: 'Special offer: Buy 2, get 1 free!',
            time: 'Yesterday',
            unread: false,
          ),
          // Add more MessageItems as needed
        ],
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final String sender;
  final String message;
  final String time;
  final bool unread;

  const MessageItem({
    required this.sender,
    required this.message,
    required this.time,
    required this.unread,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(sender),
      subtitle: Text(message),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time),
          if (unread)
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'New',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      onTap: () {
        // Handle tapping on a message
        // Navigate to a detailed message screen or take other actions
      },
    );
  }
}
