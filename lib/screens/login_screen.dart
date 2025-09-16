import 'package:flutter/material.dart';
import 'package:learn_testing/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? username;
  String? password;

  void _loginButtonTapped() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              HomeScreen(username: username, password: password),
        ),
      );
    }
  }

  void _resetButtonTapped() {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: Key('username_text_field'),
                onSaved: (value) => username = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Value cannot be empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hint: Text("username"),
                  label: Text("Username"),
                ),
              ),
              TextFormField(
                key: Key('password_text_field'),
                onSaved: (value) => password = value,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return "Value cannot be null and less than 8 char";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hint: Text("password"),
                  label: Text("Password"),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _loginButtonTapped,
                      child: Text("Login"),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: _resetButtonTapped,
                    child: Text("Reset"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
