import 'package:flutter/material.dart';

// class NoInternetPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('No Internet Connection'),
//       ),
//       body: Center(
//         child: Text(
//           'No internet connection.\nPlease check your connection and try again.',
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 20, color: Colors.red),
//         ),
//       ),
//     );
//   }
// }



class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                onPressed: () {},
                child: const Text(
                  "Refresh",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

