// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ConnectivityController extends GetxController {
//   final Connectivity _connectivity = Connectivity();
//   final _isConnected = true.obs;
//   bool _isDialogOpen = false;

//   late final StreamSubscription<ConnectivityResult> _streamSubscription;

//   @override
//   void onInit() {
//     super.onInit();
//     _checkInternetConnectivity();
//     // Listening for connectivity changes
//     _streamSubscription =
//         _connectivity.onConnectivityChanged.listen(_handleConnectionChange);
//   }

//   Future<void> _checkInternetConnectivity() async {
//     ConnectivityResult connection = await _connectivity.checkConnectivity();
//     _handleConnectionChange(connection); // Handle a single result
//   }

//   void _handleConnectionChange(ConnectivityResult connection) {
//     // Handle a single ConnectivityResult (not a list)
//     if (connection == ConnectivityResult.none) {
//       _isConnected.value = false;
//       showNoInternetDialog();
//     } else {
//       _isConnected.value = true;
//       closeDialog();
//     }
//   }

//   void showNoInternetDialog() {
//     if (_isDialogOpen) return;
//     _isDialogOpen = true;
//     Get.dialog(
//       AlertDialog(
//         title: const Text("Offline"),
//         content: const Text("You are offline. Connect and try again"),
//         actions: [
//           InkWell(
//             onTap: () {
//               _retryConnection();
//             },
//             child: const Text("Retry"),
//           )
//         ],
//       ),
//       barrierDismissible: false,
//     ).then((_) {
//       _isDialogOpen = false;
//     });
//   }

//   Future<void> _retryConnection() async {
//     ConnectivityResult connection = await _connectivity.checkConnectivity();

//     if (connection != ConnectivityResult.none) {
//       _isConnected.value = true;
//       Get.back(); // Close the dialog when connected
//     } else {
//       Get.snackbar(
//         'Offline',
//         'Check Internet Connection and try again',
//         colorText: Colors.red,
//         duration: const Duration(seconds: 3),
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

//   void closeDialog() {
//     if (_isDialogOpen) {
//       Get.back();
//       _isDialogOpen = false;
//     }
//   }

//   @override
//   void onClose() {
//     _streamSubscription.cancel();
//     closeDialog();
//     super.onClose();
//   }
// }
