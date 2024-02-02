import 'package:flutter/material.dart';
import 'package:tictactoe/responsive/responsive.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Responsive(
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 70,
            //TODO: make BLur Radius 5//
            spreadRadius: 0,
          )
        ]),
        child: ElevatedButton(
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(width, 50),
            backgroundColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
