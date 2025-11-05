import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({this.name = '', this.tasks = const []});

  // Getter untuk menghitung jumlah task yang sudah selesai
  int get completedCount => tasks
      .where((task) => task.complete)
      .length;

  // Getter untuk menampilkan pesan progress
  String get completenessMessage =>
      '$completedCount out of ${tasks.length} tasks';
}
