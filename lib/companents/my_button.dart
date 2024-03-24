import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  // ignore: use_key_in_widget_constructors
  const MyButton({Key? key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF6BB9F0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text, // Use the 'text' parameter here instead of 'Text'
            style: const TextStyle(
              fontFamily: 'poppins-regular',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
