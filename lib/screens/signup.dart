import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            // backgroundColor: const Color.fromARGB(255, 230, 176, 176),
            behavior: SnackBarBehavior.floating,
            content: Text(
              'Created account for ${userCredential.user?.email}',
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        );
        Navigator.pushNamed(context, '/login'); 
      } on FirebaseAuthException catch (e) {
        String message;
        switch (e.code) {
          case 'invalid-email':
            message = "Invalid email format.";
            break;
          case 'user-disabled':
            message = 'The user corresponding to the given email has been disabled.';
            break;
          case 'email-already-in-use':
            message = 'The email is already in use by another account.';
            break;
          case 'weak-password':
            message = 'The password provided is too weak.';
            break;
          default:
            message = 'An error occurred. Please try again.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(
              message,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        );
      }
    }
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
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _confirmPasswordController,
            cursorColor: const Color.fromRGBO(13, 18, 28, 0.867),
            decoration: InputDecoration(
              labelText: 'Confirm Password',
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
                return 'Please confirm your password';
              } else if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 32.0),
          Container(
            width: double.infinity,
            height: 48.0,
            color: Colors.white70,
            margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: TextButton(
              onPressed: _signUp,
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
              child: const Text('Sign Up'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              alignment: Alignment.center,
              child: const Text(
                "Already have an account? Log In",
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
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: SignUpPageHeader(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: _buildLoginForm(),
        ),
      ),
    );
  }
}
