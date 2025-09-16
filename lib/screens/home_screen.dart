import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String? username;
  final String? password;
  const HomeScreen({super.key, this.username, this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(username ?? "Default Username"),
            Text(password ?? "Default Password"),
          ],
        ),
      ),
    );
  }
}
