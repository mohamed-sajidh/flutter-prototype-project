import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneDialer extends StatelessWidget {
  final String phoneNumber;

  const PhoneDialer({Key? key, required this.phoneNumber}) : super(key: key);

  // Method to launch the dialer
  void _launchDialer() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    // Check if the URL can be launched
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(
        //   phoneNumber,
        //   style: TextStyle(fontSize: 24),
        // ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _launchDialer,
          child: Text('Call'),
        ),
      ],
    );
  }
}
