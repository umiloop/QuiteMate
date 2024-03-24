 import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard_home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider_input.dart';
import 'package:intl/intl.dart';


class UserData extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const UserData({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              // Title
              const Center(
                child: Text(
                  'User Data',
                  style: TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'poppins-Bold'),
                ),
              ),
              const SizedBox(height: 20),
              // User Details
              const UserDataDisplay(),
              const SizedBox(height: 100),
              // Next Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DashBoard()),);
                    // Navigate to the next screen or perform any desired action
                  },
                  style: ElevatedButton.styleFrom(
                    
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontFamily: 'AbrilFatface', color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
          // Half-circle images aligned to the right side
          Positioned(
            top: 200, // Adjusted position for the first image
            right: 0,
            child: Opacity(
              opacity: 0.6,
              child: Image.asset('assets/Ellipse 19.png')),
          ),
          Positioned(
            bottom: 164, // Adjusted position for the second image
            right: 0,
            child: Opacity(
              opacity: 0.6,
              child: Image.asset('assets/Ellipse 20.png')),
          ),
        ],
      ),
    );
  }
}

// showing user data


class UserDataDisplay extends StatelessWidget {
  const UserDataDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<UserDataProvider>(context);

  // Calculate the total days quit
    DateTime now = DateTime.now();
    int daysQuit = now.difference(userData.quitDate).inDays;

  // Calculate the money saved
    double moneySaved = userData.cigarettesPerDay * userData.pricePerCigarette * daysQuit;

  // Calculate the cigarettes avoided
    int cigarettesAvoided = userData.cigarettesPerDay * daysQuit;



    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Age ',
          style: TextStyle(
            fontFamily: 'poppins-regular',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text('${userData.age}',
        style: const TextStyle(
            fontFamily: 'poppins-regular',
            fontSize: 18,
          ),
          ),

        const SizedBox(height: 10),
        const Text(
          'Cigarettes per day: ',
          style: TextStyle(
            fontFamily: 'poppins-regular',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text('${userData.cigarettesPerDay}',
        style: const TextStyle(
            fontFamily: 'poppins-regular',
            fontSize: 18,
          ),
          ),

        const SizedBox(height: 10),
        const Text(
          'Price of a cigarette: ',
          style: TextStyle(
            fontFamily: 'poppins-regular',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Text('${userData.pricePerCigarette}',
        style: const TextStyle(
            fontFamily: 'poppins-regular',
            fontSize: 18,
          ),
          ),


        const SizedBox(height: 10),


        const Text(
  'Quit date: ',
  style: TextStyle(
    fontFamily: 'poppins-regular',
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
),
const SizedBox(height: 10),
Text(
  DateFormat('dd/MM/yyyy').format(userData.quitDate),
  style: const TextStyle(
    fontFamily: 'poppins-regular',
    fontSize: 18,
  ),
),

          const SizedBox(height: 10),
        Text(
          'Days quit: $daysQuit',
          style: const TextStyle(
            fontFamily: 'poppins-regular',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Money saved: ${moneySaved.toStringAsFixed(2)}',
          style: const TextStyle(
            fontFamily: 'poppins-regular',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Cigarettes avoided: $cigarettesAvoided',
          style: const TextStyle(
            fontFamily: 'poppins-regular',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),

      ],
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserDataProvider(),
      child: const MaterialApp(
        home: UserData(),
      ),
    ),
  );
}