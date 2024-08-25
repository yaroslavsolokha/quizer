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
    if (_currentQuestionId < questions.length - 1) {
      setState(() {
        if (userAnswer == questions[_currentQuestionId].answer) {
          _answers.add(const Icon(Icons.check, color: Colors.green));
        } else {
          _answers.add(const Icon(Icons.close, color: Colors.red));
        }

        _currentQuestionId++;
      });
    } else {
      _alertMessage();
    }
  }

  void _alertMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Restart'),
        content: const Text('You have successfully finished the quiz.'),
        actions: [
          TextButton(
            onPressed: () => {Navigator.pop(context)},
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _currentQuestionId = 0;
                _answers = [];
              });

              Navigator.pop(context);
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
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
                    Button(answer: true, onPress: _onPressed),
                    const SizedBox(width: 20),
                    Button(answer: false, onPress: _onPressed),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
