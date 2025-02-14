import 'package:flutter/material.dart';
import 'auth_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final AuthService _authService = AuthService();

  void _resetPassword() async {
    await _authService.resetPassword(emailController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Password reset email sent")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
              ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot Password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Enter your account email to reset your password.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              "Know your password? Log in here",
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),  
          ],//child: const Text("Log In", style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
      ),
    );
  }
}