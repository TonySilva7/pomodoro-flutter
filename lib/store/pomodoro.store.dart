import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

import 'package:mobx/mobx.dart';
part 'pomodoro.store.g.dart';

class PomodoroStore = PomodoroStoreBase with _$PomodoroStore;

enum TypeInterval { WORK, REST }

abstract class PomodoroStoreBase with Store {
  Timer? chronometer;
  AudioPlayer audioPlayer = AudioPlayer();

  @observable
  bool isStarted = false;

  @observable
  int minutes = 25;

  @observable
  int seconds = 0;

  @observable
  int workingTime = 25;

  @observable
  int restTime = 5;

  @observable
  TypeInterval typeInterval = TypeInterval.WORK;

  int workCycle = 0;

  // ---

  Future<void> playSound(String typeSound) async {
    if (typeSound == 'rest') {
      await audioPlayer.play(AssetSource('audio/rest.mp3'));
    } else if (typeSound == 'working') {
      await audioPlayer.play(AssetSource('audio/working.mp3'));
    } else {
      await audioPlayer.play(AssetSource('audio/long_rest2.mp3'));
    }
  }

  Future<void> stopSound() async {
    await audioPlayer.stop();
  }

  @action
  void startTimer() {
    isStarted = true;

    if (isWorking()) playSound('working');

    // Timer.periodic recebe um tempo e uma função que será executada a cada tempo
    chronometer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0) {
        _changeTypeInterval();
      } else if (seconds == 0) {
        minutes--;
        seconds = 59;
      } else {
        seconds--;
      }
    });
  }

  @action
  void stopTimer() {
    isStarted = false;
    chronometer?.cancel();
    stopSound();
  }

  @action
  void restartTimer() {
    stopTimer();
    minutes = isWorking() ? workingTime : restTime;
    seconds = 0;
    workCycle = 0;
    typeInterval = TypeInterval.WORK;
  }

  @action
  void incrementWorkingTime() {
    workingTime++;
    if (isWorking()) restartTimer();
  }

  @action
  void decrementWorkingTime() {
    if (workingTime < 1) {
      return;
    }

    workingTime--;
    if (isWorking()) restartTimer();
  }

  @action
  void incrementRestTime() {
    restTime++;
    if (isResting()) restartTimer();
  }

  @action
  void decrementRestTime() {
    if (restTime < 1) {
      return;
    }
    restTime--;
    if (isResting()) restartTimer();
  }

  // ---
  void _changeTypeInterval() {
    if (isWorking()) {
      playSound('rest');
      typeInterval = TypeInterval.REST;
      workCycle++;

      if (workCycle >= 4) {
        playSound('long_rest2');
        minutes = restTime * 3;
        workCycle = 0;
      } else {
        minutes = restTime;
      }
    } else {
      playSound('working');
      typeInterval = TypeInterval.WORK;
      minutes = workingTime;
    }
    seconds = 0;
  }

  bool isWorking() {
    return typeInterval == TypeInterval.WORK;
  }

  bool isResting() {
    return typeInterval == TypeInterval.REST;
  }
}
