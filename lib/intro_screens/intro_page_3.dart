import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[400],
      child: Center(
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Stay Motivated',
              style: TextStyle(
                fontFamily:'AbrilFatface' ,
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10,),
            Lottie.asset(
              'assets/Animation - 1710675061517 (1).json', // Replace 'image_name.png' with the path to your image asset
              width: 200, // Adjust the width to fit your layout
              height: 200, // Adjust the height to fit your layout
            ),
            const SizedBox(height: 10),
            const Text(
              'Receive daily reminders and motivation to keep you going',
               textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                color: Colors.black,
                fontSize: 16,
              ),
              ),  
          ],
        ),
        ),
    );
  }
}