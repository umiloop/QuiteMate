import 'package:flutter/material.dart';
// Import the next question screen
import 'package:flutter_application_1/provider_input.dart';
import 'package:flutter_application_1/question%20screen/user_details.dart';
import 'package:provider/provider.dart'; // Import the UserDataProvider

class FourthQuestionScreen extends StatelessWidget {
  const FourthQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.centerRight, // Adjust alignment as needed
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                // Aesthetic design with blue and black half circle
                const SizedBox(
                  width: double.infinity,
                  height: 200,
                 
                  child: Center(
                    child: SizedBox(
                      height: 170,
                      child: Text(
                        'When Was Your Quit Date?',
                        textAlign: TextAlign.center, // Align text to the center
                        style: TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'poppins-Bold'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),

                // Quit date picker

                const QuitDatePicker(),
                const SizedBox(height: 170),


                // Continue button
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the fifth question screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UserData()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Set button color to blue
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontFamily: 'AbrilFatface', color: Colors.black, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
            // Stack the images here
            Positioned(
              bottom: 150, // Adjust position as needed
              child: Opacity(
                opacity: 0.7,
                child: Image.asset('assets/Ellipse 19.png'),
              ),
            ),
            Positioned(
              bottom: 158, // Adjust position as needed
              child: Opacity(
                opacity: 0.7,
                child: Image.asset('assets/Ellipse 20.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Define the QuitDatePicker widget for selecting the quit date
class QuitDatePicker extends StatefulWidget {
  const QuitDatePicker({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuitDatePickerState createState() => _QuitDatePickerState();
}

class _QuitDatePickerState extends State<QuitDatePicker> {
  DateTime _selectedDate = DateTime.now(); // Initial value for selected date

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900), // Limit the earliest selectable date
      lastDate: DateTime.now(), // Limit the latest selectable date
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        var userData = Provider.of<UserDataProvider>(context, listen: false);
            userData.setQuitedate(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          
          TextButton(
            onPressed: () => _selectDate(context),
            child: Text(
              '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
              style: const TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
