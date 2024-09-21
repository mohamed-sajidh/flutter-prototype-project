import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.wifi_off,
          color: Colors.black,
          size: 125,
        ),
        const Text(
          "No Internet Connection",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "Please Check the Internet Connection",
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
          onPressed: () {
          },
          child: const Text("Refresh", style: TextStyle(color: Colors.white),),
        )
      ],
    );
  }
}
