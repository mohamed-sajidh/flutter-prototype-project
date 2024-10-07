import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_widgets/stepper/stepper_controller.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final StepperController stepperController = Get.find();

    return Container(
      height: 300,
      width: 100,
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "this is Checkout page",
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
