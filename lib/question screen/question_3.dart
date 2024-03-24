import 'package:flutter/material.dart';
import 'package:flutter_application_1/question%20screen/question_4.dart'; // Import the next question screen
import 'package:flutter_application_1/provider_input.dart';
import 'package:provider/provider.dart'; // Import the UserDataProvider

class ThirdQuestionScreen extends StatelessWidget {
  const ThirdQuestionScreen({super.key});

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
                        'What is the Price of One Cigarette?',
                        textAlign: TextAlign.center, // Align text to the center
                        style: TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'poppins-Bold'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                // Price of one cigarette input field
                const PricePerCigaretteInput(),
                const SizedBox(height: 170),
                // Continue button
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the fourth question screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FourthQuestionScreen()),
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
                opacity: 0.4,
                child: Image.asset('assets/Ellipse 19.png'),
              ),
            ),
            Positioned(
              bottom: 158, // Adjust position as needed
              child: Opacity(
                opacity: 0.4,
                child: Image.asset('assets/Ellipse 20.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Define the PricePerCigaretteInput widget for getting the input from the user
class PricePerCigaretteInput extends StatefulWidget {
  const PricePerCigaretteInput({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PricePerCigaretteInputState createState() => _PricePerCigaretteInputState();
}

class _PricePerCigaretteInputState extends State<PricePerCigaretteInput> {
  double _pricePerCigarette = 0; // Initial value for price per cigarette

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true), // Allow numeric input including decimal
        decoration: InputDecoration(
          labelText: 'Enter Price of One Cigarette',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onChanged: (value) {
          // Update the value of price per cigarette as the user types
          setState(() {
            _pricePerCigarette = double.tryParse(value) ?? 0;
            var userData = Provider.of<UserDataProvider>(context, listen: false);
            userData.setPricePerCigaratte(_pricePerCigarette);
          });
        },
      ),
    );
  }
}
