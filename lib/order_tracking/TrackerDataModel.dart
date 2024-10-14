class TrackerDetails {
  final String title;
  final String datetime;

  TrackerDetails({required this.title, required this.datetime});
}

class TrackerData {
  final String title;
  final String date;
  final List<TrackerDetails> trackerDetails;
  final bool canDeliver; // New property to control delivery option

  TrackerData({
    required this.title,
    required this.date,
    required this.trackerDetails,
    this.canDeliver = false, // Default to false
  });
}
