import 'package:get/get.dart';
import 'package:testing_widgets/order_tracking/TrackerDataModel.dart';

List<Map<String, dynamic>> sampleData = [
  {
    "title": "Order Placed",
    "date": "Sat, 8 Apr '22",
    "tracker_details": [
      {
        "title": "Your order was placed on Zenzzen",
        "datetime": "Sat, 8 Apr '22 - 17:17",
      },
      {
        "title": "Zenzzen Arranged A Callback Request",
        "datetime": "Sat, 8 Apr '22 - 17:42",
      },
    ],
    "canDeliver": false, // Cannot deliver yet
  },
  {
    "title": "Order Shipped",
    "date": "Sun, 9 Apr '22",
    "tracker_details": [
      {
        "title": "Your order was shipped with MailDeli",
        "datetime": "Sun, 9 Apr '22 - 09:30",
      },
    ],
    "canDeliver": false, // Can offer delivery option
  },
  {
    "title": "Order Delivered",
    "date": "Mon, 10 Apr '22",
    "tracker_details": [
      {
        "title": "You received your order, by MailDeli",
        "datetime": "Mon, 10 Apr '22 - 10:00",
      },
    ],
    "canDeliver": false, // No delivery option available
  },
];


class OrderTrackingController extends GetxController {
  var isLoading = true.obs;
  var trackerDataList = <TrackerData>[].obs;
  var currentStep = 0.obs; // This keeps track of the current step

  OrderTrackingController() {
    // Simulate loading data from API
    loadData();
  }

  void loadData() {
    // Populate the trackerDataList from sampleData
    trackerDataList.value = sampleData.map((data) {
      return TrackerData(
        title: data['title'],
        date: data['date'],
        trackerDetails: (data['tracker_details'] as List).map((detail) {
          return TrackerDetails(
            title: detail['title'],
            datetime: detail['datetime'],
          );
        }).toList(),
        canDeliver: data['canDeliver'], // Set canDeliver
      );
    }).toList();

    // Simulate a status update (you can adjust this logic based on your needs)
    currentStep.value = 0; // Start with Order Placed
    isLoading.value = false;
  }

  void updateStep() {
    // Increment the step (you can add checks to ensure it doesn't exceed bounds)
    if (currentStep.value < trackerDataList.length - 1) {
      currentStep.value++;
    }
  }
}
