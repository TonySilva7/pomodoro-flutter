import 'package:flutter/material.dart';

class Chronometer extends StatelessWidget {
  const Chronometer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromRGBO(237, 59, 32, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Hora de trabalhar',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '25:00',
              style: TextStyle(
                fontSize: 100,
                color: Colors.white70,
              ),
            ),
          ],
        ));
  }
}
