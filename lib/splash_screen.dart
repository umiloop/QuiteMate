import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> with SingleTickerProviderStateMixin{
 @override
  void initState() {
    
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  
  Future.delayed( const Duration(seconds:2 ),(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_) =>  const OnBoardingScreen(),
      ));
  });
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40), // Adjust the radius to match your preference
              child: Image.asset(
                'assets/Designer.png', 
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Quite\n',
                    style: TextStyle(
                      fontFamily: 'AbrilFatface',
                      color: Colors.black,
                      fontSize: 50,
                    ),
                  ),
                  TextSpan(
                    text: '   Mate',
                    style: TextStyle(
                      fontFamily: 'AbrilFatface',
                      color: Colors.black,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
