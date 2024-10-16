import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testing_widgets/connection_checker/internet_checker_app.dart';
import 'package:testing_widgets/profile/mortage.dart';
import 'package:testing_widgets/profile/real_estate_profile.dart';
import 'package:testing_widgets/whatsApp_message/vibration_checking_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Get.put(ConnectivityController());
  runApp(
    InternetCheckerApp(child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MortgagePage(),
    );
  }
}
