import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  final _isConnected = true.obs;
  bool _isDialogOpen = false;

  late final StreamSubscription _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    _checkInternetConnectivity();

    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_handleConnectionChange);
  }

  Future<void> _checkInternetConnectivity() async {
    List<ConnectivityResult> connections =
        await _connectivity.checkConnectivity();

    _handleConnectionChange(connections);
  }

  void _handleConnectionChange(List<ConnectivityResult> connections) {
    if (connections.contains(ConnectivityResult.none)) {
      _isConnected(false);
      showNoInternetDialog();
    } else {
      _isConnected(true);
      closeDialog();
    }
  }

  void showNoInternetDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text("Offline"),
        content: const Text("You are offline. Connect and try again"),
        actions: [
          InkWell(
            onTap: () {
              print("button pressed");
            },
            child: const Text("retry"),
          )
        ],
      ),
    );
  }

  void closeDialog() {
    if (_isDialogOpen) {
      Get.back();
      _isDialogOpen = false;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    closeDialog();
    super.onClose();
  }
}
