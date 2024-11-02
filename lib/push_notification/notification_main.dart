import 'package:flutter/material.dart';
import 'package:testing_widgets/push_notification/local_notification_service.dart';

class NotificationMain extends StatelessWidget {
  const NotificationMain({super.key});

  @override
  Widget build(BuildContext context) {
    LocalNotificationService localNotificationService =
        LocalNotificationService();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notification Main"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            localNotificationService.showLocalNotification(
                "Yay you did it!", "Congrats on your first local notification");
          },
          child: Container(
            height: 40,
            width: 150,
            color: Colors.red,
            child: const Center(
              child: Text("click here"),
            ),
          ),
        ),
      ),
    );
  }
}
