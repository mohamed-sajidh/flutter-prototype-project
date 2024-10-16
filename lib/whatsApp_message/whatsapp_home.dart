import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_widgets/whatsApp_message/call_number.dart';
import 'package:testing_widgets/whatsApp_message/phone_dialer.dart';
import 'package:testing_widgets/whatsApp_message/whatsapp_service.dart';

class WhatsappHome extends StatelessWidget {
  const WhatsappHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("for sending message"),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      whatsapp();
                    },
                    child: const Text(
                      "Click here ->",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("for calling"),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      launchDialer('+918848032490');
                    },
                    child: const Text(
                      "Click here ->",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),

              // const PhoneDialer(phoneNumber: '+918848032490'),
            ],
          ),
        ),
      ),
    );
  }
}
