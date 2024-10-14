import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testing_widgets/customDropdown.dart';
import 'package:testing_widgets/custom_appbar/custom_main_class.dart';
import 'package:testing_widgets/internet_connection/internet_connection.dart';
import 'package:testing_widgets/internet_connection_latest/connectivity_controller.dart';
import 'package:testing_widgets/internet_connection_latest/home_page.dart';
import 'package:testing_widgets/order_tracking/TimeLineTile/order_tracking_timeline.dart';
import 'package:testing_widgets/order_tracking/order_tracking_demo.dart';
import 'package:testing_widgets/searchBar.dart';
import 'package:testing_widgets/search_options/home_page.dart';
import 'package:testing_widgets/search_options/search_bar.dart';
import 'package:testing_widgets/searchbar/search_screen.dart';
import 'package:testing_widgets/stepper/cart_page.dart';
import 'package:testing_widgets/stepper/stepper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ConnectivityController());
  runApp(const MyApp());
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
      home: const InternetPage(),
    );
  }
}
