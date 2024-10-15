import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testing_widgets/connection_checker/no_internet_page.dart';

class InternetCheckerApp extends StatefulWidget {
  final Widget child;

  InternetCheckerApp({required this.child});

  @override
  _InternetCheckerAppState createState() => _InternetCheckerAppState();
}

class _InternetCheckerAppState extends State<InternetCheckerApp> {
  late StreamSubscription<ConnectivityResult> _subscription;
  bool hasConnection = true;

  @override
  void initState() {
    super.initState();

    // Check initial connectivity status
    checkConnectivity();

    // Listen for connectivity changes
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      bool isConnected = result != ConnectivityResult.none;
      print('Connection changed: $result'); // Print when connection changes
      setState(() {
        hasConnection = isConnected;
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  // Function to check initial connectivity and print the result
  void checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    print('Initial connection status: $result');
    setState(() {
      hasConnection = result != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show NoInternetPage if there's no connection
    if (!hasConnection) {
      return NoInternetPage();
    }

    // Otherwise, show the main app
    return widget.child;
  }
}
