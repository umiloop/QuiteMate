import 'package:flutter/material.dart';
import 'package:flutter_application_1/question%20screen/question_3.dart'; // Import the next question screen
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider_input.dart';

class SecondQuestionScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SecondQuestionScreen({Key? key});

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
                      height: 150,
                      child: Text(
                        'How Many Cigarettes Do You Consume Per Day?',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'poppins-Bold'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                // Cigarettes per day input field
                const CigarettesPerDayInput(),
                const SizedBox(height: 170),
                // Continue button
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      // Fetch the instance of UserDataProvider
                      // ignore: unused_local_variable
                      var userData = Provider.of<UserDataProvider>(context, listen: false);
                      // Navigate to the third question screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ThirdQuestionScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
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
                opacity: 0.5,
                child: Image.asset('assets/Ellipse 19.png'),
              ),
            ),
            Positioned(
              bottom: 158, // Adjust position as needed
              child: Opacity(
                opacity: 0.5,
                child: Image.asset('assets/Ellipse 20.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Define the CigarettesPerDayInput widget for getting the input from the user
class CigarettesPerDayInput extends StatefulWidget {
  const CigarettesPerDayInput({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CigarettesPerDayInputState createState() => _CigarettesPerDayInputState();
}

class _CigarettesPerDayInputState extends State<CigarettesPerDayInput> {
  int _cigarettesPerDay = 0; // Initial value for cigarettes per day

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Enter Cigarettes you consumed per Day',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onChanged: (value) {
          // Update the value of cigarettes per day as the user types
          setState(() {
            _cigarettesPerDay = int.tryParse(value) ?? 0;
            var userData = Provider.of<UserDataProvider>(context, listen: false);
            userData.setCigarettesPerDay(_cigarettesPerDay);
          });
        },
      ),
    );
  }
}
