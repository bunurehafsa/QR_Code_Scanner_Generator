import 'package:flutter/material.dart';
//import 'package:qr_code_scanner_generator/home.dart';
import 'package:qr_code_scanner_generator/login.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _photoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('https://task-management-backend-vhcq.onrender.com/api/v1/registration'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _emailController.text,
          'password': _passwordController.text,
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'mobile': _mobileController.text,
          'photo': _photoController.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          // Navigate to the login page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration failed')));
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
        title: Center(child: Text('Registration')),
        backgroundColor: Color.fromARGB(255, 133, 165, 202),
      ),
      body: Stack(
        children: [
          
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/1.jpg'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    height: 600,
                    width: 500,
                    
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 173, 191, 211).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(13.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Registration Form',style: TextStyle(color:const Color.fromARGB(255, 1, 36, 65),fontSize: 25),),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter your email ',
                            filled: true,
                            fillColor: Colors.white38,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter email';
                            } else if (!value.contains('@')) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password ',
                            filled: true,
                            fillColor: Colors.white38,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            hintText: 'Enter your first name ',
                            filled: true,
                            fillColor: Colors.white38,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          validator: (value) => value!.isEmpty ? 'Enter first name' : null,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            hintText: 'Enter your last name ',
                            filled: true,
                            fillColor: Colors.white38,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          validator: (value) => value!.isEmpty ? 'Enter last name' : null,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _mobileController,
                          decoration: InputDecoration(
                            labelText: 'Mobile',
                            filled: true,
                            fillColor: Colors.white38,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          validator: (value) => value!.isEmpty ? 'Enter mobile number' : null,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _photoController,
                          decoration: InputDecoration(
                            labelText: 'Photo URL',
                            filled: true,
                            fillColor: Colors.white38,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          validator: (value) => value!.isEmpty ? 'Enter photo URL' : null,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _register,
                          child: Text('Submit',style: TextStyle(color: Colors.purple,fontSize: 15)),
                        ),
                      ],
                    ),
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
