import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  // Create a TextEditingController to manage the TextField input
  final TextEditingController _nameController = TextEditingController();
  
  // Flag to check if the TextField is empty
  bool _isEmpty = false;

  void onStart(BuildContext context) {
    // Get the value from the TextField using the controller
    String name = _nameController.text;

    // Check if the name is empty
    if (name.isEmpty) {
      // Set the flag to true to change the hint text color to red
      setState(() {
        _isEmpty = true;
      });
      print("Please enter your name!");
      return; // Stop further actions if the name is empty
    }

    // Print the name to the console
    print("User Name: $name");

    // Clear the TextField input
    _nameController.clear();

    // Navigate to the next screen
    Navigator.of(context).pushNamed('screen_questions');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center items vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center items horizontally
          children: [
            Image.asset('assets/images/logo.png'), // Display logo image
            Text(
              "Maths Quiz",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontFamily: 'InknutAntiqua',
                fontWeight: FontWeight.w800,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: TextField(
                controller: _nameController, // Attach the controller to the TextField
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  hintStyle: TextStyle(
                    color: _isEmpty ? Colors.red : Colors.black, // Change color to red if empty
                    fontFamily: 'InknutAntiqua',
                    fontWeight: FontWeight.w800,
                  ),
                  hintText: "Your Name Please",
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  onStart(context); // Call onStart when the button is pressed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ), // Button padding
                ),
                child: Text(
                  "Start Quiz",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'InknutAntiqua',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
