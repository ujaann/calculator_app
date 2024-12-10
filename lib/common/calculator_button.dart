import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CalculatorButton({super.key,required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Ink(
        height: 60,
        width: 60,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.blue[200]), 
        child: Center(child: Text(text,style: const TextStyle(fontSize: 26),)),
      ),
    );
  }
}