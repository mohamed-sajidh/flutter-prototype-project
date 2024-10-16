import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_widgets/real_estate_footer/footer.dart';

class RealFooterMainPage extends StatelessWidget {
  const RealFooterMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text("This is the dummy text"),
          SizedBox(
            height: 40,
          ),
          FooterSection()
        ],
      ),
    );
  }
}
