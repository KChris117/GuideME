// detail_1page.dart
import 'package:flutter/material.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(16.0),
          child: Column( // Removed const here
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Change Languages',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const Text(
                'Select One of the Languages Below',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 20), // Add space between the headings and the list
              _buildLanguageOption(context, 'English', 'assets/languages/eng.png'),
              _buildLanguageOption(context, 'Indonesia', 'assets/languages/idn.png'),
              _buildLanguageOption(context, 'Spain', 'assets/languages/spn.png'),
              // Add more languages as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(BuildContext context, String language, String flagPath) {
    return MouseRegion(
      cursor: SystemMouseCursors.click, // Change cursor to pointer
      child: GestureDetector(
      onTap: () {
        // Handle language selection logic here
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Language changed to $language')),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0), // Padding inside the box
          margin: const EdgeInsets.symmetric(vertical: 8.0), // Margin between boxes
          decoration: BoxDecoration(
            color: Colors.white, // Light grey background color
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
            border: Border.all(color: Colors.black), // Border color
          ),
        child: Row(
          children: [
            // Language Flag
            Image.asset(
              flagPath,
              width: 40, // Set the desired width for the flag
              height: 30, // Set the desired height for the flag
            ),
            const SizedBox(width: 16), // Add space between flag and text
            // Language Name
            Text(
              language,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}