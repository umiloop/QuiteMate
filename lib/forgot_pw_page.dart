import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

@override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try{
      await FirebaseAuth.instance
       .sendPasswordResetEmail(email: _emailController.text.trim());
       showDialog(
      
      // ignore: use_build_context_synchronously
      context: context,
       builder: (context){
        return const AlertDialog(
          content: Text('Password Reset Link Sent!Check your Email'),
        );
       },
       );
    } on FirebaseAuthException catch (e){
      // ignore: avoid_print
      print(e);
      showDialog(
      // ignore: use_build_context_synchronously
      context: context,
       builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
       }
       );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Enter Your Email and we will  send you a Password reset link',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20,
            fontFamily: 'poppins-bold'),
            ),
          ),
          const SizedBox(height: 50,),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:const BorderSide(color: Colors.deepPurple),
                  borderRadius:BorderRadius.circular(12),
                   ),
                  hintText: 'Email',
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
            ),
            ), 

            const SizedBox(height: 50,),
            
            MaterialButton(
              onPressed: passwordReset,
              color: Colors.blueAccent,
              child: const Text('Reset password'),
              ),
        ],
      ),
    );
  }
}