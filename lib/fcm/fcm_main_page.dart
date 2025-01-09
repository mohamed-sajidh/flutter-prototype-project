import 'package:flutter/material.dart';

class FcmMainPage extends StatelessWidget {
  const FcmMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Fcm Main Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                print("press here button tapped");
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.blueAccent)
                ),
                height: 40,
                width: 150,
                child: const Center(child: Text("press here"),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
