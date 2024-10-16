import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

callNumber() async{
  const number = '+918848032490'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}

void launchDialer(phoneNumber) async {
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
