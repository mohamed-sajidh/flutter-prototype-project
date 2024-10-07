import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testing_widgets/customDropdown.dart';
import 'package:testing_widgets/internet_connection/internet_connection.dart';
import 'package:testing_widgets/searchBar.dart';
import 'package:testing_widgets/stepper/cart_page.dart';
import 'package:testing_widgets/stepper/stepper.dart';

void main() {
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
      home: const UserCart(),
    );
  }
}


