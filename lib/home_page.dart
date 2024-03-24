import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/question%20screen/question_1.dart';
import 'package:lottie/lottie.dart'; // Import the lottie package

class HomePage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomePage({Key? key});

  // Sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  // Navigate to the next screen
  void navigateToNextScreen(BuildContext context) {
    // Replace `NextScreen` with the name of your screen class
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FirstQuestionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Image.asset('assets/Ellipse 19.png'),
              Positioned(
                bottom: 5,
                child: Image.asset('assets/Ellipse 20.png'),
              ),
            ],
          ),


           
          

         
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                 child: 
                  Positioned(
                    bottom: 60,
                    child: Lottie.asset(
                      'assets/Animation - 1710795156067.json',
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),

                const Center(
             child: Text(
                    'Welcome to Quite Mate Club',
                    textAlign: TextAlign.center,
                    
                    style: TextStyle(
                      fontFamily: 'AbrilFatface',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
           ),
                
                
                const SizedBox(height: 5),
                Text(
                  // ignore: unnecessary_string_interpolations
                  '${user?.email ?? "Unknown"}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => navigateToNextScreen(context),
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF6BB9F0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'G e t  I n',
                  style: TextStyle(
                    fontFamily: 'Abrilfatface',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
