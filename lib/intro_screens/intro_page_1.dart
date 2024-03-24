import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

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
              'Welcome to Quite Mate',
              style: TextStyle(
                fontFamily:'AbrilFatface' ,
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10,),
            Lottie.asset(
              'assets/Animation - 1710672669883.json', // Replace 'image_name.png' with the path to your image asset
              width: 200, // Adjust the width to fit your layout
              height: 200, // Adjust the height to fit your layout
            ),
            const SizedBox(height: 10),
            const Text(
              'Your ultimate companion in quitting smoking',
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