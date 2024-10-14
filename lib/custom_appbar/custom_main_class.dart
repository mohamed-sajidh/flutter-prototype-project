import 'package:flutter/material.dart';
import 'package:testing_widgets/custom_appbar/appBar.dart';

class CustomMainClass extends StatelessWidget {
  const CustomMainClass({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomappbarHomescreen(),
        ],
      ),
    );
  }
}
