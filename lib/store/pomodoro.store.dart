import 'package:mobx/mobx.dart';
part 'pomodoro.store.g.dart';

class PomodoroStore = PomodoroStoreBase with _$PomodoroStore;

abstract class PomodoroStoreBase with Store {
  @observable
  int minutes = 2;

  @observable
  int seconds = 0;

  @observable
  int workingTime = 2;

  @observable
  int restTime = 1;

  @action
  void incrementWorkingTime() {
    workingTime++;
  }

  @action
  void decrementWorkingTime() {
    workingTime--;
  }

  @action
  void incrementRestTime() {
    restTime++;
  }

  @action
  void decrementRestTime() {
    restTime--;
  }
}
