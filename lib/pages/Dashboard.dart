import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent, // Example app bar color
        elevation: 1, // Add a subtle shadow
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center( // Center the content on the screen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Dashboard, You are Successfully Login!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}