import 'package:calorie_check/components/continue_button.dart';
import 'package:calorie_check/screens/activity_level.dart';
import 'package:flutter/material.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String firstname = '';
  String lastname = '';
  String suffix = '';
  double height = 0.0;
  double weight = 0.0;
  int age = 0;
  String sex = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); // Navigate back to the previous screen (Signup)
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
                Text(
                  'Fill up your personal information',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'First Name is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    firstname = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Last Name is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    lastname = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Suffix (optional)'),
                  onSaved: (value) {
                    suffix = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Height (cm)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Height is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    height = double.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Weight (kg)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Weight is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    weight = double.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Age is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    age = int.parse(value!);
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('Sex:'),
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 'Male',
                      groupValue: sex,
                      onChanged: (value) {
                        setState(() {
                          sex = value as String;
                        });
                      },
                    ),
                    Text('Male'),
                    Radio(
                      value: 'Female',
                      groupValue: sex,
                      onChanged: (value) {
                        setState(() {
                          sex = value as String;
                        });
                      },
                    ),
                    Text('Female'),
                  ],
                ),
                SizedBox(height: 40),
                ContinueButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // All fields are valid, proceed to the next page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ActivityLevelForm()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
