import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_widgets/stepper/address_page.dart';
import 'package:testing_widgets/stepper/checkout_page.dart';
import 'package:testing_widgets/stepper/payment_page.dart';
import 'package:testing_widgets/stepper/stepper_controller.dart';

class StepperPage extends StatelessWidget {
  final StepperController _stepperController = Get.put(StepperController());

  // Function to get the app bar title based on the current step
  String _getAppBarTitle(int currentStep) {
    switch (currentStep) {
      case 0:
        return "Checkout";
      case 1:
        return "Address";
      case 2:
        return "Payment";
      default:
        return "Checkout";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            _getAppBarTitle(_stepperController.currentStep.value),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (_stepperController.currentStep.value > 0) {
              // Move to the previous step if the current step is greater than 0
              _stepperController.previousStep();
            } else {
              // Navigate back if the user is on the first step
              Get.back();
            }
          },
        ),
      ),
      body: Obx(
        () {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Colors.green, // Active step color and primary button color
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Stepper(
                    type: StepperType.horizontal,
                    currentStep: _stepperController.currentStep.value,
                    onStepContinue: _stepperController.nextStep,
                    onStepCancel: _stepperController.previousStep,
                    controlsBuilder:
                        (BuildContext context, ControlsDetails details) {
                      return Container(); // This removes the default buttons
                    },
                    steps: [
                      Step(
                        title: const Text("Checkout"),
                        content: const Checkout(),
                        isActive: _stepperController.currentStep.value >= 0,
                        state: _stepperController.currentStep.value > 0
                            ? StepState.complete
                            : StepState.indexed,
                      ),
                      Step(
                        title: const Text("Address"),
                        content: const AddressPage(),
                        isActive: _stepperController.currentStep.value >= 1,
                        state: _stepperController.currentStep.value > 1
                            ? StepState.complete
                            : StepState.indexed,
                      ),
                      Step(
                        title: const Text("Payment"),
                        content: const PaymentPage(),
                        isActive: _stepperController.currentStep.value >= 2,
                        state: _stepperController.currentStep.value == 2
                            ? StepState.complete
                            : StepState.indexed,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
