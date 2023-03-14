import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:pomodoro/widgets/chron_button.dart';
import 'package:provider/provider.dart';

class Chronometer extends StatelessWidget {
  const Chronometer({super.key});

  String handleTimer(int time) {
    return time.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Container(
        color: const Color.fromRGBO(237, 59, 32, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hora de trabalhar',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${handleTimer(store.minutes)}:${handleTimer(store.seconds)}',
              style: const TextStyle(
                fontSize: 100,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ChronButton(
                  text: 'Iniciar',
                  icon: Icons.play_arrow,
                ),
                ChronButton(
                  text: 'Parar',
                  icon: Icons.stop,
                ),
                ChronButton(
                  text: 'Reiniciar',
                  icon: Icons.refresh,
                ),
              ],
            )
          ],
        ));
  }
}
