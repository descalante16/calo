import 'package:flutter/material.dart';

class ActivityLevelForm extends StatefulWidget {
  const ActivityLevelForm({super.key});

  @override
  _ActivityLevelFormState createState() => _ActivityLevelFormState();
}

class _ActivityLevelFormState extends State<ActivityLevelForm> {
  String selectedLevel = '';

  var formKey = GlobalKey<FormState>();

  List<String> activityLeveList = [
    'Sedentary',
    'Light Exercise',
    'Moderate Exercise',
    'Active Exercise',
    'Very Active Exercise',
    'Extra Active Exercise'
  ];

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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Text(
                "Choose the category that best represents your average weekly activity level:",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            // Radio buttons
            Container(
              margin: EdgeInsets.only(top: 10, left: 30, right: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.red[200],
              ),
              child: Column(
                children: activityLeveList
                    .map(
                      (gender) => RadioListTile(
                        title: Text(gender),
                        value: gender,
                        groupValue: selectedLevel,
                        onChanged: (value) {
                          setState(() {
                            selectedLevel = value.toString();
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 40),

            Container(
              width: 340,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  var isFormValid = formKey.currentState!.validate();
                  if (isFormValid) {
                    // Save to database
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ), // Set the color of the button
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
