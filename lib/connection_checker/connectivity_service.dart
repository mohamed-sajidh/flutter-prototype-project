import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  late StreamController<ConnectivityResult> _connectionStatusController;

  ConnectivityService() {
    _connectionStatusController = StreamController<ConnectivityResult>();
    _checkInitialConnection();
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectionStatusController.add(result);
    });
  }

  Stream<ConnectivityResult> get connectionStatusStream =>
      _connectionStatusController.stream;

  Future<void> _checkInitialConnection() async {
    var initialStatus = await _connectivity.checkConnectivity();
    _connectionStatusController.add(initialStatus);
  }

  void dispose() {
    _connectionStatusController.close();
  }
}
