import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_widgets/connection_checker/internet_checker_app.dart';
import 'package:testing_widgets/push_notification/local_notification_service.dart';
import 'package:testing_widgets/sample_login_screen/login_provider.dart';
import 'package:testing_widgets/sample_login_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService localNotificationService =
      LocalNotificationService();

  await localNotificationService.setup();

  runApp(
    InternetCheckerApp(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
