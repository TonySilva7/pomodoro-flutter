import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:pomodoro/widgets/chronometer.dart';
import 'package:pomodoro/widgets/timer_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

class Pomodoro extends StatelessWidget {
  Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tony's Pomodoro"),
        // backgroundColor: store.isWorking() ? const Color.fromRGBO(176, 0, 0, 1) : const Color(0xFF2e9923),
        backgroundColor: Colors.black87,
      ),
      body: Column(
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
                    increment: store.isStarted && store.isWorking() ? null : store.incrementWorkingTime,
                    decrement: store.isStarted && store.isWorking() ? null : store.decrementWorkingTime,
                  ),
                  TimerIn(
                    title: 'Descanso',
                    value: store.restTime,
                    increment: store.isStarted && store.isResting() ? null : store.incrementRestTime,
                    decrement: store.isStarted && store.isResting() ? null : store.decrementRestTime,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
