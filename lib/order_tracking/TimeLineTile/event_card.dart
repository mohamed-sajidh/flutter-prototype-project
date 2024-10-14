import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final text;
  const EventCard({super.key, required this.isPast, required this.text, });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: isPast ? Colors.green : const Color.fromARGB(255, 213, 239, 214),
        borderRadius: BorderRadius.circular(5)
      ),
      child: text
    );
  }
}