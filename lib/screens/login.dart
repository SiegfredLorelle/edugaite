import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle login logic here (e.g., form validation, authentication)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logging in as ${_emailController.text}')),
      );
    }
  }


  Widget HomePageHeader() {
    return Container(
      height: 60.0, // Set desired height
      color: Colors.white70,
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
      child: Center(
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: const Text(
                "Welcome Back",
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
            cursorColor: Color.fromRGBO(13, 18, 28, 0.867),
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: TextStyle(color: const Color.fromRGBO(79, 102, 150, 1)), // Label text color
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0), // Border radius

              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: const Color.fromRGBO(232, 235, 242, 0.867)), // Border color when enabled
                borderRadius: BorderRadius.circular(12.0), // Border radius

              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(13, 18, 28, 0.867)), // Border color when focused
                borderRadius: BorderRadius.circular(12.0), // Border radius

              ),
              fillColor: const Color.fromRGBO(232, 235, 242, 0.867), // Background color of the textbox
              filled: true,
              hintStyle: TextStyle(color: const Color.fromARGB(255, 2, 1, 1)), // Hint text color
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),

          SizedBox(height: 16.0),

          TextFormField(
            controller: _passwordController,
            cursorColor: Color.fromRGBO(13, 18, 28, 0.867),

            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: const Color.fromRGBO(79, 102, 150, 1)), // Label text color
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0), // Border radius
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: const Color.fromRGBO(232, 235, 242, 0.867)), // Border color when enabled
                borderRadius: BorderRadius.circular(12.0), // Border radius

              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(13, 18, 28, 0.867)), // Border color when focused
                borderRadius: BorderRadius.circular(12.0), // Border radius

              ),
              fillColor: const Color.fromRGBO(232, 235, 242, 0.867), // Background color of the textbox
              filled: true,
              hintStyle: TextStyle(color: const Color.fromARGB(255, 2, 1, 1)), // Hint text color
            ),  
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _login,
            child: Text('Login'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: HomePageHeader(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildLoginForm(),
      ),
    );
  }
  
}

