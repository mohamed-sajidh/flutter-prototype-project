import 'package:flutter/material.dart';

class CustomappbarHomescreen extends StatefulWidget {
  const CustomappbarHomescreen({super.key});

  @override
  State<CustomappbarHomescreen> createState() => _CustomappbarHomescreenState();
}

class _CustomappbarHomescreenState extends State<CustomappbarHomescreen> {
  final List<String> items = ['option 1', 'option 2', 'option 3', 'option 4'];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 220,
      width: screenWidth,
      decoration: const BoxDecoration(color: Colors.blue),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 260,
                  child: DropdownButton<String>(
                    focusColor: Colors.blue,
                    dropdownColor: Colors.blue,
                    iconEnabledColor: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.zero),
                    value: selectedValue,
                    hint: const Text(
                      'Kochi',
                      style: TextStyle(color: Colors.white),
                    ),
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hii Ameen",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Find Your Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 40,
                )
              ],
            ),
            // Wrap the Stack in a SizedBox to provide layout constraints
            SizedBox(
              height: 30, // Set the height for the stack container
              child: Stack(
                clipBehavior: Clip.none, // Allow content to be outside the stack
                children: [
                  // The mini container placed at the bottom, partially outside
                  Positioned(
                    bottom: -50, // Move half of the container outside
                    left: screenWidth * 0.1, // Adjust horizontal alignment as needed
                    child: Container(
                      height: 50,
                      width: screenWidth * 0.8, // Adjust width as needed
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: const Offset(0, 2), // Shadow position
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Mini Container",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
