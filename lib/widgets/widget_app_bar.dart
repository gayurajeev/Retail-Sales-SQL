import 'package:flutter/material.dart';

class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WidgetAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      automaticallyImplyLeading: false, // Removes the back button
      title: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Align items to the start
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 50, // Adjust the width as needed
              height: 50, // Adjust the height as needed
            ),
            SizedBox(width: 10), // Space between the image and text
            Text(
              "Maths Quiz",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white, // Ensure the text is white for contrast
                fontWeight: FontWeight.bold,
                fontFamily: "InknutAntiqua",
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
