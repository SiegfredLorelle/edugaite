import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage ({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  Widget SignUpPageHeader() {
    return Container(
      height: 60.0, // Set desired height
      color: Colors.white70,
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Edu',
              style: TextStyle(
                fontSize: 24.0,
                color: Color.fromRGBO(221, 150, 12, 0.867),
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'GAIte',
              style: TextStyle(
                fontSize: 24.0,
                color: Color.fromRGBO(35, 89, 197, 0.867),
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: const Text(
              "Create an Account",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                color: Color.fromRGBO(13, 18, 28, 0.867),
                fontFamily: "Lexend",
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          TextFormField(
            controller: _emailController,
            cursorColor: const Color.fromRGBO(13, 18, 28, 0.867),
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: const TextStyle(
                  color: Color.fromRGBO(
                      79, 102, 150, 1)), // Label text color
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0), // Border radius
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromRGBO(
                        232, 235, 242, 0.867)), // Border color when enabled
                borderRadius: BorderRadius.circular(12.0), // Border radius
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromRGBO(
                        13, 18, 28, 0.867)), // Border color when focused
                borderRadius: BorderRadius.circular(12.0), // Border radius
              ),
              fillColor: const Color.fromRGBO(
                  232, 235, 242, 0.867), // Background color of the textbox
              filled: true,
              hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 2, 1, 1)), // Hint text color
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _passwordController,
            cursorColor: const Color.fromRGBO(13, 18, 28, 0.867),
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: const TextStyle(
                  color: Color.fromRGBO(
                      79, 102, 150, 1)), // Label text color
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0), // Border radius
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromRGBO(
                        232, 235, 242, 0.867)), // Border color when enabled
                borderRadius: BorderRadius.circular(12.0), // Border radius
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromRGBO(
                        13, 18, 28, 0.867)), // Border color when focused
                borderRadius: BorderRadius.circular(12.0), // Border radius
              ),
              fillColor: const Color.fromRGBO(
                  232, 235, 242, 0.867), // Background color of the textbox
              filled: true,
              hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 2, 1, 1)), // Hint text color
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 32.0),
          InkWell(
            onTap: () {},
            child: Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Forget Password?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 48.0,
            color: Colors.white70,
            margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(
                    26, 92, 229, 0.867), // Set your desired background color
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Customize button shape
                ),
                foregroundColor: const Color.fromRGBO(232, 235, 242, 0.867),
                textStyle: const TextStyle(
                  fontSize: 16.0, // Set text size
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Log In'),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              alignment: Alignment.center,
              child: const Text(
                "New User? Sign Up",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: SignUpPageHeader(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildLoginForm(),
      ),
    );
  }
}
