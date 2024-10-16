import 'package:flutter/material.dart';

void show(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      final TextEditingController nameController = TextEditingController();
      final TextEditingController phoneController = TextEditingController();
      int selectedValue = 1;

      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: 800,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Name",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 192, 191, 191),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Enter your phone number",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: "9874563021",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 192, 191, 191),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Property Details",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color.fromARGB(255, 139, 138, 138),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Radio<int>(
                                value: 1,
                                groupValue: selectedValue,
                                activeColor: Colors.green,
                                onChanged: (int? value) {
                                  setState(() {
                                    selectedValue = value!;
                                  });
                                },
                              ),
                              const Text("House"),
                            ],
                          ),
                          Row(
                            children: [
                              Radio<int>(
                                value: 2,
                                groupValue: selectedValue,
                                activeColor: Colors.green,
                                onChanged: (int? value) {
                                  setState(() {
                                    selectedValue = value!;
                                  });
                                },
                              ),
                              const Text("Land"),
                            ],
                          ),
                          Row(
                            children: [
                              Radio<int>(
                                value: 3,
                                groupValue: selectedValue,
                                activeColor: Colors.green,
                                onChanged: (int? value) {
                                  setState(() {
                                    selectedValue = value!;
                                  });
                                },
                              ),
                              const Text("Apprtment"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.add, color: Colors.blue),
                          SizedBox(width: 10),
                          Text(
                            'Add Bank',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 139, 138, 138),
                            ),
                          )
                          // child: ,
                          )
                    ],
                  ),

                  const SizedBox(height: 15,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print("button pressed");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      // onPressed: () {
                      //    Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MyNavigationBar()),
                      // );
                      // },
                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
