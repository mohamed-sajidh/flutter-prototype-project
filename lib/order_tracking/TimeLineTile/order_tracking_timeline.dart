import 'package:flutter/material.dart';
import 'package:testing_widgets/order_tracking/TimeLineTile/time_line_tile.dart';

class OrderTrackingTimeline extends StatefulWidget {
  final bool isOrderPlaced;
  final bool isOrderShipped;
  final bool isOrderDelivered;
  const OrderTrackingTimeline({
    super.key,
    required this.isOrderPlaced,
    required this.isOrderShipped,
    required this.isOrderDelivered,
  });

  @override
  State<OrderTrackingTimeline> createState() => _OrderTrackingTimelineState();
}

class _OrderTrackingTimelineState extends State<OrderTrackingTimeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            MyTimeLineTile(
              isFirst: true,
              isLast: false,
              isPast: widget.isOrderPlaced,
              eventCard: const Text(
                "Order Placed, October 12",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
            ),
            MyTimeLineTile(
              isFirst: false,
              isLast: false,
              isPast: widget.isOrderShipped,
              eventCard: const Text(
                "Order Shipped",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
            ),
            MyTimeLineTile(
              isFirst: false,
              isLast: true,
              isPast: widget.isOrderDelivered,
              eventCard: const Text(
                "Order Delivered",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
            )
          ],
        ),
      ),
    );
  }
}
