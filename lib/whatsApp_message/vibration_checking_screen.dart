import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_widgets/whatsApp_message/whatsapp_home.dart';
import 'package:flutter/services.dart';

class VibrationCheckingScreen extends StatelessWidget {
  const VibrationCheckingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vibration Checking Screen'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            HapticFeedback.vibrate();

            Get.to(() => const WhatsappHome());
          },
          child: const Text(
            "Click here ->",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
