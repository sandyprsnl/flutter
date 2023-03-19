class Task {
  final String text;
  bool isDone;
  Task({required this.text, this.isDone = false});

  void toggleIsDone() {
    isDone = !isDone;
  }
}
