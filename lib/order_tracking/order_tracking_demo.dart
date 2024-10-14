// import 'package:flutter/material.dart';

// class OrderTrackingWidget extends StatelessWidget {
//   final String trackingStatus;
//   final String? orderPlacedDate;
//   final String? shippedDate;
//   final String? deliveredDate;

//   const OrderTrackingWidget({
//     super.key,
//     required this.trackingStatus,
//     this.orderPlacedDate,
//     this.shippedDate,
//     this.deliveredDate,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Order Tracking Info"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(40.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             _buildTrackingStep(
//               stepTitle: 'Order Placed',
//               stepDate: orderPlacedDate,
//               isCompleted: trackingStatus == 'order_placed' ||
//                   trackingStatus == 'shipped' ||
//                   trackingStatus == 'delivered',
//             ),
//             Row(
//               children: [
//                 _buildTrackingConnector(trackingStatus == 'shipped' ||
//                     trackingStatus == 'delivered'),
//               ],
//             ),
//             _buildTrackingStep(
//               stepTitle: 'Shipped',
//               stepDate: shippedDate,
//               isCompleted:
//                   trackingStatus == 'shipped' || trackingStatus == 'delivered',
//             ),
//             Row(
//               children: [
//                 _buildTrackingConnector(trackingStatus == 'delivered'),
//               ],
//             ),
//             _buildTrackingStep(
//               stepTitle: 'Delivered',
//               stepDate: deliveredDate,
//               isCompleted: trackingStatus == 'delivered',
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTrackingStep({
//     required String stepTitle,
//     required String? stepDate,
//     required bool isCompleted,
//   }) {
//     return Row(
//       children: [
//         Icon(
//           isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
//           color: isCompleted ? Colors.green : Colors.grey,
//         ),
//         const SizedBox(width: 8),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               stepTitle,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: isCompleted ? Colors.black : Colors.grey,
//               ),
//             ),
//             if (stepDate != null)
//               Text(
//                 stepDate,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: isCompleted ? Colors.black : Colors.grey,
//                 ),
//               ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildTrackingConnector(bool isActive) {
//     return Container(
//       height: 40,
//       width: 2,
//       color: isActive ? Colors.green : Colors.grey[300],
//       margin: const EdgeInsets.only(left: 10),
//     );
//   }
// }

// animation tracking info -----------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_widgets/order_tracking/OrderTrackingController.dart';

// class OrderTrackingPage extends StatelessWidget {
//   final OrderTrackingController controller = Get.put(OrderTrackingController());

//   OrderTrackingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Order Tracking"),
//       ),
//       body: Obx(
//         () {
//           if (controller.isLoading.value) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: OrderTrackerZen(
//                 tracker_data: controller.trackerDataList.map(
//                   (trackerData) {
//                     return TrackerData(
//                       title: trackerData.title,
//                       date: trackerData.date,
//                       tracker_details: trackerData.trackerDetails.map((detail) {
//                         return TrackerDetails(
//                           title: detail.title,
//                           datetime: detail.datetime,
//                         );
//                       }).toList(),
//                     );
//                   },
//                 ).toList(),
//                 isShrinked: false,
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
