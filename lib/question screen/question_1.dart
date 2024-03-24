import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider_input.dart';
import 'package:flutter_application_1/question%20screen/question_2.dart';
import 'package:provider/provider.dart';

class FirstQuestionScreen extends StatelessWidget {
  const FirstQuestionScreen({super.key});

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
                const SizedBox(height: 100),
                // Aesthetic design with blue and black half circle
                const Center(
                  child: Text(
                    'How Old Are You?',
                    style: TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'poppins-bold'),
                  ),
                ),
                
                // Age slider
                const AgeSlider(),
                const SizedBox(height:350),
                // Continue button
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the second question screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SecondQuestionScreen()),
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

              bottom: 150,
              child: Opacity(
                opacity: 0.7,
                child: Image.asset('assets/Ellipse 19.png'))),
              Positioned(
              bottom: 158, // Adjust position as needed
              child: Opacity(
                opacity: 0.7,
                child: Image.asset('assets/Ellipse 20.png')),
            ),
          ],
        ),
      ),
    );
  }
}

class AgeSlider extends StatefulWidget {
  const AgeSlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AgeSliderState createState() => _AgeSliderState();
}

class _AgeSliderState extends State<AgeSlider> {
  double _age = 18; // Initial age value

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _age,
      min: 18,
      max: 100,
      divisions: 82, // Number of divisions between min and max age
      activeColor: Colors.black, // Set slider color to blue
    
      onChanged: (value) {
        setState(() {
          _age = value;
          var userData = Provider.of<UserDataProvider>(context, listen: false);
          userData.setAge(_age.toInt());
        });
      },
      label: _age.round().toString(), // Display the selected age as a label
    );
  }
}

// Define the SecondQuestionScreen and other screens similarly...
