import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Text field controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  int _selectedValue = 1;

  // Gender selection state
  String gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/profile_background_img.png',
                    fit: BoxFit.fill,
                  ),
                ),

                // Form Card
                Padding(
                  padding: const EdgeInsets.only(top: 230.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const Positioned(
                            left: 20,
                            child: Text(
                              "Complete Your Profile",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Name Text Field
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
                          const SizedBox(height: 15),
                          const Row(
                            children: [
                              Text(
                                "Email Id",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Email Text Field
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Email ID",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 192, 191, 191),
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Row(
                            children: [
                              Text(
                                "Date of birth",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Date of Birth Text Field
                          TextFormField(
                            controller: dobController,
                            decoration: InputDecoration(
                              labelText: "Date of Birth",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 192, 191, 191),
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Gender Selection
                          const Row(
                            children: [
                              Text(
                                "Gender",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 10,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Radio<int>(
                                        value: 1,
                                        groupValue: _selectedValue,
                                        activeColor: Colors.green,
                                        onChanged: (int? value) {
                                          setState(() {
                                            _selectedValue = value!;
                                          });
                                        },
                                      ),
                                      const Text("Male"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<int>(
                                        value: 2,
                                        groupValue: _selectedValue,
                                        activeColor: Colors.green,
                                        onChanged: (int? value) {
                                          setState(() {
                                            _selectedValue = value!;
                                          });
                                        },
                                      ),
                                      const Text("Female"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<int>(
                                        value: 3,
                                        groupValue: _selectedValue,
                                        activeColor: Colors.green,
                                        onChanged: (int? value) {
                                          setState(() {
                                            _selectedValue = value!;
                                          });
                                        },
                                      ),
                                      const Text("Others"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                          // Save Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                print("button pressed");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
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
                                "Save",
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
