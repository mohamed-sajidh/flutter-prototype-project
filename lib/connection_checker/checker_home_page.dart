import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_widgets/connection_checker/cart_page.dart';

class CheckerHomePage extends StatelessWidget {
  const CheckerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You are connected to the internet!'),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const CartPage());
              },
              child: const Text(
                "click here ->",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
