import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => LoginOrRegisterPageState();
}

class LoginOrRegisterPageState extends State<LoginOrRegisterPage> {

// initially show login page

  bool showLoginPage = true;

// toggle between login and register pageset
void togglePages(){
  setState(() {
    showLoginPage = !showLoginPage;
  });

}
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return const LoginPage();
      
    }
    return Container(); // Corrected Container usage
  }
}
