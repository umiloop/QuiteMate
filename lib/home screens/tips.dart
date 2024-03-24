// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard_home.dart';
import 'package:flutter_application_1/home%20screens/setting.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

const Color primaryColor = Color(0xFF38B66A); // Green color (adjust as needed)
const Color accentColor = Color(0xFFF8F8F8); // Light gray color (adjust as needed)

const TextStyle titleStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  color: primaryColor,
);

const TextStyle descriptionStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.grey,
);

class TipData {
  final String title;
  final String description;
  final String image;

  TipData({
    required this.title,
    required this.description,
    required this.image,
  });
}

final List<TipData> _tipData = [
  TipData(
    title: 'Find Your Calm Place',
    description: 'Take 5 minutes to meditate, breathe deeply, or listen to calming music.',
    image: 'assets/still-4e792cd1c5f27c4ea2e1c700120619e0.png',
  ),
  TipData(
    title: 'Connect with Supportive People',
    description: 'Talk to friends, family, or a support group who understand your journey.',
    image: 'assets/original-d108ebcf01d0341042f932166a44286d.jpg',
  ),
  TipData(
    title: 'Drink Plenty of Water',
    description: 'Water helps flush toxins and cravings from your body.',
    image: 'assets/original-4e5dba93e97e9736558857e23e2dc9bf.jpg',
  ),
  TipData(
    title: 'Find Healthy Distractions',
    description: 'Exercise, hobbies, or spending time with loved ones can help.',
    image: 'assets/istockphoto-1222178625-612x612.jpg',
  ),
  TipData(
    title: 'Reward Your Progress',
    description: 'Celebrate milestones and treat yourself for staying smoke-free.',
    image: 'assets/VC_Featured-Image-light.png',
  ),
];

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  int _selectedIndex = 1; // Default index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuiteMate - Smoking Tips',
        
         style: TextStyle(color:  Colors.black,
         fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Optional: Remove shadow for a flatter look
        shape: const RoundedRectangleBorder( 
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),)
      ),
      body: ListView.builder(
        itemCount: _tipData.length,
        itemBuilder: (context, index) => _buildTipCard(context, _tipData[index]),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: GNav(
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: const Color(0xFF38B66A),
            padding: const EdgeInsets.all(15),
            tabs: const [
               GButton(icon: Icons.dashboard, text: 'DashBoard'),
               GButton(icon: Icons.tips_and_updates, text: 'Tips'),
               GButton(icon: Icons.settings, text: 'Setting'),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
              switch (index) {
                case 0:
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DashBoard()));
                  break;
                case 1:
                  // Do nothing or handle as needed
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

  Widget _buildTipCard(BuildContext context, TipData tipData) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                tipData.image,
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tipData.title,
                    style: titleStyle,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    tipData.description,
                    style: descriptionStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TipsScreen(),
  ));
}
