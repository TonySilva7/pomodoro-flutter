import 'package:flutter/material.dart';

class TimerIn extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback? increment;
  final VoidCallback? decrement;

  const TimerIn({super.key, required this.title, required this.value, this.increment, this.decrement});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: decrement,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: const Color.fromRGBO(207, 29, 16, 1),
                padding: const EdgeInsets.all(5),
              ),
              child: const Icon(Icons.arrow_downward),
            ),
            Text(
              '$value min',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: increment,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: const Color.fromRGBO(207, 29, 16, 1),
                padding: const EdgeInsets.all(5),
              ),
              child: const Icon(Icons.arrow_upward),
            ),
          ],
        )
      ],
    );
  }
}
