import 'package:flutter/material.dart';
import 'package:quizer/data/questions.dart';
import 'package:quizer/widgets/button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentQuestionId = 0;
  List<Icon> _answers = [];

  void _onPressed(bool userAnswer) {
    setState(() {
      if (userAnswer == questions[_currentQuestionId].answer) {
        _answers.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        _answers.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      if (_currentQuestionId < questions.length - 1) {
        _currentQuestionId++;
      } else {
        _currentQuestionId = 0;
        _answers = [];

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Quiz was finished and reseted'),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        title: const Text('Quizer'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Card(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        questions[_currentQuestionId].question,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Button(
                      answer: true,
                      color: Colors.green,
                      onPress: _onPressed,
                    ),
                    const SizedBox(width: 20),
                    Button(
                      answer: false,
                      color: Colors.red,
                      onPress: _onPressed,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: _answers,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
