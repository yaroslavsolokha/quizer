import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.answer, required this.onPress});

  final bool answer;
  final void Function(bool answer) onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => onPress(answer),
        style: ElevatedButton.styleFrom(
          backgroundColor: answer ? Colors.green : Colors.red,
        ),
        child: Text(
          answer ? 'True' : 'False',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
