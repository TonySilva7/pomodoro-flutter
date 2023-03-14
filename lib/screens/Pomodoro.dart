import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pomodoro/widgets/chronometer.dart';
import 'package:pomodoro/widgets/timer_in.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro'),
        backgroundColor: const Color.fromRGBO(176, 0, 0, 1),
      ),
      body: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Chronometer(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  TimerIn(title: 'Trabalho', value: 25),
                  TimerIn(title: 'Descanso', value: 25),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
