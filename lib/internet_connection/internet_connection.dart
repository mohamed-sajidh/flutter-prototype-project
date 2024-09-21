import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:testing_widgets/internet_connection/no_internet_connection.dart';

class InternetHomePage extends StatefulWidget {
  const InternetHomePage({super.key});

  @override
  State<InternetHomePage> createState() => _InternetHomePageState();
}

class _InternetHomePageState extends State<InternetHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Internet Connection"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              // Handle if the data is a list of results
              ConnectivityResult result;
              if (snapshot.data is List<ConnectivityResult>) {
                result = (snapshot.data as List<ConnectivityResult>).first;
              } else {
                result = snapshot.data;
              }

              // Now process the connectivity result
              if (result == ConnectivityResult.mobile) {
                return connected("Mobile");
              } else if (result == ConnectivityResult.wifi) {
                return connected("WiFi");
              } else {
                return const NoInternetConnection();
              }
            } else {
              return loading();
            }
          },
        ),
      ),
    );
  }
}

Widget loading() {
  return const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
    ),
  );
}

Widget connected(String type) {
  return Center(
    child: Text(
      "$type Connected",
      style: const TextStyle(
        color: Colors.green,
        fontSize: 20,
      ),
    ),
  );
}

// Widget noInternetConnection() {
//   return 
// }
