import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.answer,
      required this.color,
      required this.onPress});

  final bool answer;
  final Color color;
  final void Function(bool answer) onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          onPress(answer);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
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
