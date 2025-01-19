import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

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
              padding: const EdgeInsets.all(24),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
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
                  // Add functionality here, e.g., navigate or submit
                  print("Button Pressed!");
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
