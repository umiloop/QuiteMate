import 'package:flutter/material.dart';
import 'package:flutter_application_1/home%20screens/Tips.dart';
import 'package:flutter_application_1/home%20screens/setting.dart';
import 'package:flutter_application_1/provider_input.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;
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

    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //app bar
            const SizedBox(height: 25,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Text(
                    'Hello, ',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'There ',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  //setting button if needed will see
                ],
              ),
            ),
            const SizedBox(height: 10,),
            //smoke free tab
            Container(
              width: 370,
              height: 120,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Smoke Free For',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'poppins-regular',
                    ),
                  ),

                  const SizedBox(height: 10),
                  // database data
                  const Text(' '),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '$daysQuit days',
                        style: const TextStyle(
                          fontFamily: 'poppins-bold',
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            // Money saved tab
            Container(
              width: 370,
              height: 120,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.greenAccent, // Change color as needed
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Money Saved',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'poppins-regular',
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Database data
                  // Replace with actual data
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        ' Lkr ${moneySaved.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontFamily: 'poppins-bold',
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            // Cigarettes avoided tab
            Container(
              width: 370,
              height: 120,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orangeAccent, // Change color as needed
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cigarettes Avoided',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'poppins-regular',
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Database data
                  // Replace with actual data
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '$cigarettesAvoided',
                        style: const TextStyle(
                          fontFamily: 'poppins-bold',
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            // Placeholder for CarouselSlider with three images
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/LungsSmoking.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/4440146.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/4429372.jpg',
                  fit: BoxFit.cover,
                ),
              ],
              options: CarouselOptions(
                height: 210,
                aspectRatio: 16/9,
                enlargeCenterPage: true,
                autoPlay: true, // Set to true for automatic sliding
                autoPlayInterval: const Duration(seconds: 3), // Set interval for automatic sliding
                autoPlayAnimationDuration: const Duration(milliseconds: 800), // Set animation duration for sliding
                autoPlayCurve: Curves.fastOutSlowIn, // Set animation curve for sliding
                pauseAutoPlayOnTouch: true, // Pause automatic sliding on touch
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:  Container(
        color: Colors.white,
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          
          child: GNav(
            
            backgroundColor: Colors.white,
                color: Colors.black,
                activeColor: Colors.blueAccent.shade700,
                tabBackgroundColor: Colors.blueAccent.withOpacity(0.1),
                padding: const EdgeInsets.all(15),
                
            
            
            tabs: const [
              GButton(icon: Icons.dashboard,
              text: 'DashBoard',),
              GButton(icon: Icons.tips_and_updates,
               text: 'Tips',),
              
              GButton(icon: Icons.settings,
               text: 'Setting',),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index){
              setState(() {
                _selectedIndex = index;
              });
              switch(index){
                case 0:
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DashBoard()));
            break;
          case 1:
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TipsScreen()));
            break;
          case 2:
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SettingsScreen()));
            break;
              }
            },
            ),
        ),
      ),
    );
  }
}