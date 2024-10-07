import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testing_widgets/stepper/stepper.dart';

class UserCart extends StatelessWidget {
  const UserCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UserCart"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Get.back();
            //
          },
        ),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Get.to(() => StepperPage());
          },
          child: Container(
            height: 50,
            width: 100,
            color: Colors.green,
            child: const Center(
              child: Text(
                "continue",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
