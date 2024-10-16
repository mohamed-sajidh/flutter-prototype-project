import 'package:flutter/material.dart';
import 'package:testing_widgets/profile/bottom_sheet.dart';

class MortgagePage extends StatelessWidget {
  const MortgagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 400,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 40,
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.home,
                          size: 22,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Mortage",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          // Property Loan Button

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Add functionality for Property Loan
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.account_balance,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Property Loan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    show(context);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.add, color: Colors.blue),
                      SizedBox(width: 10),
                      Text(
                        'Add your property',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
