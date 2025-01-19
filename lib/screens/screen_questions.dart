import 'package:flutter/material.dart';
import 'package:maths_quiz/widgets/widget_app_bar.dart';

class ScreenQuestions extends StatefulWidget {
  const ScreenQuestions({super.key});

  @override
  State<ScreenQuestions> createState() => _ScreenQuestionsState();
}

class _ScreenQuestionsState extends State<ScreenQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WidgetAppBar(),
      body: Container(
        width: double.infinity,
        color: Colors.black, // Background color
        padding: const EdgeInsets.all(16), // Add padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align content to the top
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
          children: [
            const SizedBox(height: 50),
            Text(
              "Q) 1",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 50), // Space before question text
            Center(
              child: Text(
                "35 * 26",
                style: const TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 80), // Space before options
            Expanded(
              child: ListView.builder(
                itemCount: 4, // Number of options
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('screen_leaderboard');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 42, 41, 41), // Button background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Rounded corners
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ), // Button padding
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20), 
                          Text(
                            '${index + 1})', // Left-aligned numbering
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                          // Spacing between number and text
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
