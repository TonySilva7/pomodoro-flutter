import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class TimerIn extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback? increment;
  final VoidCallback? decrement;

  const TimerIn({super.key, required this.title, required this.value, this.increment, this.decrement});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22),
        ),
        const SizedBox(height: 20),
        Observer(builder: (ctx) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: decrement,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: store.isWorking() ? const Color.fromRGBO(176, 0, 0, 1) : const Color(0xFF2e9923),
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
                  backgroundColor: store.isWorking() ? const Color.fromRGBO(176, 0, 0, 1) : const Color(0xFF2e9923),
                  padding: const EdgeInsets.all(5),
                ),
                child: const Icon(Icons.arrow_upward),
              ),
            ],
          );
        })
      ],
    );
  }
}
