import 'package:calorie_check/screens/personal_info_form.dart';
import 'package:flutter/material.dart';
import 'package:calorie_check/components/continue_button.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';

  String username = '';

  String password = '';

  String confirmPassword = '';

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle the arrow back icon press (e.g., navigate back)
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Text(
                    'Enter your credentials to continue',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.red[200]),
                    labelText: 'Email Address',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.red[200]),
                    labelText: 'Username',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.red[200]),
                    labelText: 'Password',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    // Add suffixIcon for eye icon
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.red[200],
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    password = value!;
                  },
                  obscureText: !isPasswordVisible,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.red[200]),
                    labelText: 'Confirm Password',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    // Add suffixIcon for eye icon
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.red[200],
                      ),
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm password is required';
                    } else if (confirmPassword != password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    confirmPassword = value!;
                  },
                  obscureText: !isConfirmPasswordVisible,
                ),
                SizedBox(height: 40),
                ContinueButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // All fields are valid, proceed to the next page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalInfoForm()),
                      );
                    }
                  },
                ),
                SizedBox(height: 10),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // add the log in page to navigate
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w200,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
