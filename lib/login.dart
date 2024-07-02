import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qr_code_scanner_generator/Registration.dart';
import 'package:qr_code_scanner_generator/home.dart';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('https://task-management-backend-vhcq.onrender.com/api/v1/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed')));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${response.statusCode}')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 66, 6, 122),
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('bg3.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Form content
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter Email',
                          filled: true,
                          fillColor: Colors.white54,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          filled: true,
                          fillColor: Colors.white54,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        obscureText: !_isPasswordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _login,
                        child: Text('Login', style: TextStyle( fontSize: 15)),
                      ),
                       SizedBox(
                        height: 20,

                      ),
                      Text("Don't Have an account?", style: TextStyle(color: const Color.fromARGB(255, 245, 243, 245), fontSize: 13)),
                      SizedBox(
                        height: 10,

                      ),
                      ElevatedButton(onPressed: () {
                         Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => RegistrationScreen(),
            ),
          );
                      }, child: Text('Try Signup'))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
