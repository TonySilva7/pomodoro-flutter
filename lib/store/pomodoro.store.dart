import 'dart:async';

import 'package:mobx/mobx.dart';
part 'pomodoro.store.g.dart';

class PomodoroStore = PomodoroStoreBase with _$PomodoroStore;

enum TypeInterval { WORK, REST }

abstract class PomodoroStoreBase with Store {
  Timer? chronometer;

  @observable
  bool isStarted = false;

  @observable
  int minutes = 2;

  @observable
  int seconds = 0;

  @observable
  int workingTime = 2;

  @observable
  int restTime = 1;

  @observable
  TypeInterval typeInterval = TypeInterval.WORK;

  int workCycle = 0;

  // ---

  @action
  void startTimer() {
    isStarted = true;

    chronometer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
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
  }

  @action
  void restartTimer() {
    stopTimer();
    minutes = isWorking() ? workingTime : restTime;
    seconds = 0;
    workCycle = 0;
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
      typeInterval = TypeInterval.REST;
      workCycle++;

      if (workCycle >= 4) {
        minutes = restTime * 3;
        workCycle = 0;
      } else {
        minutes = restTime;
      }
    } else {
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
