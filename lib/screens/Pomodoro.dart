import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:pomodoro/widgets/chronometer.dart';
import 'package:pomodoro/widgets/timer_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

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
              child: Observer(
                builder: (ctx) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TimerIn(
                      title: 'Trabalho',
                      value: store.workingTime,
                      increment: store.incrementWorkingTime,
                      decrement: store.decrementWorkingTime,
                    ),
                    TimerIn(
                      title: 'Descanso',
                      value: store.restTime,
                      increment: store.incrementRestTime,
                      decrement: store.decrementRestTime,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
