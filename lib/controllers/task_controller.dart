import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/database/database.dart';
import 'package:to_do_list_app/providers/task.dart';
import 'package:to_do_list_app/widgets/task_bar.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  List<Task> items = [];

  Future<int> addTask(Task task) async {
    return await DatabaseHelper.insert(task);
  }

  Future<void> getTasks(String dateSelected) async {
    List<Map<String, dynamic>> tasks =
        await DatabaseHelper(dateSelected).query();
    items.assignAll(tasks.map((e) => Task.fromJson(e)).toList());
  }

  Future<void> delete(Task task) async {
    await DatabaseHelper.delete(task);
  }

  Future<void> updateTable(int? id, int? completed) async {
    await DatabaseHelper.update(id, completed);
  }
}
