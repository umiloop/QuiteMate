import 'package:flutter/material.dart';
import 'package:flutter_application_1/intro_screens/intro_page_1.dart';
import 'package:flutter_application_1/intro_screens/intro_page_2.dart';
import 'package:flutter_application_1/intro_screens/intro_page_3.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //controller to keep track of which page we're on
  final PageController _controller = PageController();

  //keep track of if we are on the last page or not
  // ignore: non_constant_identifier_names
  bool OnLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                OnLastPage = (index == 2);
              });

            },
        children: const [
          IntroPage1(),
          IntroPage2(),
          IntroPage3(),
        ],
      ),
      //dot indicator
      Container(
        alignment: const Alignment(0, 0.75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            //skip button
            GestureDetector(
              onTap: () {
                _controller.jumpToPage(2);
              },
              
              child: const Text('Skip',style:TextStyle(fontFamily: 'AbrilFatface',fontSize: 20,),)),

            //dot indicator
            SmoothPageIndicator(controller: _controller, count: 3),
            //next or done
            OnLastPage ?
            GestureDetector(
            onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return const LoginPage();
    }),
  );
},

              child: const Text('Done',
              style:TextStyle(fontFamily: 'AbrilFatface',fontSize: 20,),
              ),
              ) 
              : GestureDetector(
              onTap: () {
                _controller.nextPage(duration: const Duration(milliseconds: 500), 
                curve: Curves.easeIn);
              },
              child: const Text('Next',style:TextStyle(fontFamily: 'AbrilFatface',
              fontSize: 20,),),)
          ],
        ))
        ],
      )
    );
  }
}