import 'package:flutter/material.dart';
import 'package:testing_widgets/order_tracking/TimeLineTile/event_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final eventCard;
  const MyTimeLineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.eventCard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
            color: isPast
                ? Colors.green
                : const Color.fromARGB(255, 213, 239, 214)),
        indicatorStyle: IndicatorStyle(
          width: 30,
          color:
              isPast ? Colors.green : const Color.fromARGB(255, 213, 239, 214),
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: isPast ? Colors.white : Colors.green.shade50,
            fontSize: 18,
          ),
        ),
        endChild: EventCard(isPast: isPast, text: eventCard),
      ),
    );
  }
}
