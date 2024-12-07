import 'package:flutter/material.dart';

class CleanTextFieldPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  // Function to sanitize the input
  String sanitizeInput(String input) {
    // Remove all spaces and unwanted special characters
    return input.replaceAll(RegExp(r'[^\w]'), '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Text After Submit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter Text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Sanitize the input on submit
                final cleanedText = sanitizeInput(_controller.text);

                // Show sanitized text in a dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Cleaned Text'),
                    content: Text(cleanedText),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CleanTextFieldPage(),
  ));
}
