import 'package:flutter/material.dart';
import 'package:sv/models/task_model.dart';
import 'package:sv/models/user_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = <Task>[];
  User user = User("Hieu");

  Color H1 = Colors.red.shade50;
  Color H2 = Colors.red.shade200;
  Color H3 = Colors.red.shade800;
  Color H4 = Colors.red.shade900;

  int get numTasks => tasks.length;

  int get numTasksRemaining => tasks.where((task) => !task.complete).length;

  String get username => user.username;
  //add Task
  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  // return task index to point for checkbox
  bool getTaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

  // return task title show to do task
  String getTaskTitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  //
  void deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  void setTaskValue(int taskIndex, bool taskvalue) {
    tasks[taskIndex].complete = taskvalue;
    notifyListeners();
  }

  void updateUsername(String newUsername) {
    user.username = newUsername;
    notifyListeners();
  }

  void deleteAllTasks() {
    tasks.clear();
    notifyListeners();
  }

  void deleteCompletedTasks() {
    tasks = tasks.where((task) => !task.complete).toList();
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: ((context) {
          return bottomSheetView;
        }));
  }
}
