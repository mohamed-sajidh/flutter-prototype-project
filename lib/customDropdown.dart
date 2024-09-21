import 'package:flutter/material.dart';

class DropdownContainer extends StatefulWidget {
  const DropdownContainer({super.key});

  @override
  _DropdownContainerState createState() => _DropdownContainerState();
}

class _DropdownContainerState extends State<DropdownContainer> {
  bool isExpanded = false; // To track if the container is expanded or not
  String selectedValue = "Select a value"; // Initially displayed text
  List<String> apiData = ["Hello", "how", "are", "you bro", "i am ", "fine and", "i am thanks bro"]; // Data from API

  // Function to toggle expansion
  void toggleContainer() {
    setState(() {
      isExpanded = !isExpanded;
    });

    // If expanding, make the API call
    if (isExpanded) {
      fetchData();
    }
  }

  // Mock API call using Dio
  Future<void> fetchData() async {
    try {
      print("------------- API called ---------------");
      // Simulate a delay
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  // Function to select an option from the dropdown
  void selectValue(String value) {
    setState(() {
      selectedValue = value;
      isExpanded = false; // Close the dropdown after selecting a value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expandable Dropdown"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: toggleContainer,
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedValue), // Display the selected value
                    Icon(isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            // Dropdown-like expansion directly under the main container without space
            if (isExpanded)
              Container(
                // Removed the margin to make the dropdown touch the main container
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  border: Border.all(color: Colors.grey),
                ),
                child: apiData.isEmpty
                    ? const Center(child: CircularProgressIndicator()) // Loading indicator until data is fetched
                    : ConstrainedBox(
                        constraints: BoxConstraints(
                          // Limit height to ensure it scrolls when there are more than 5 items
                          maxHeight: apiData.length > 5 ? 200 : double.infinity,
                        ),
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          shrinkWrap: true, // Important for ensuring the dropdown height is limited
                          itemCount: apiData.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(apiData[index]),
                              onTap: () => selectValue(apiData[index]), // Select the value
                            );
                          },
                        ),
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
