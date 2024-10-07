import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_widgets/stepper/stepper_controller.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final StepperController stepperController = Get.find();

    return Container(
      height: 300,
      width: 100,
      color: const Color.fromARGB(255, 65, 64, 64),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "this is Payment page",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            InkWell(
              onTap: () {
                stepperController.nextStep();
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
          ],
        ),
      ),
    );
  }
}
