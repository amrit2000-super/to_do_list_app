import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/controllers/task_controller.dart';
import 'package:to_do_list_app/providers/task.dart';
import 'package:to_do_list_app/screens/add_task_bar.dart';
import 'package:to_do_list_app/themes/themes.dart';

class MyButton extends StatelessWidget {
  final String label;
  final String title;
  final String notes;
  final String Date;
  final int selectedColor;
  MyButton(this.label, this.title, this.notes, this.Date, this.selectedColor);

  @override
  Widget build(BuildContext context) {
    final _taskControler = Get.put(TaskController());
    return GestureDetector(
      onTap: () async {
        if (label == 'Add Task+') {
          Navigator.of(context).pushNamed(AddTaskBar.routePage);
        } else {
          if (title.isEmpty || notes.isEmpty) {
            Get.snackbar('Required', 'Please fill the details',
                icon: Icon(
                  Icons.error_outline_outlined,
                  color: Colors.red,
                ),
                snackPosition: SnackPosition.BOTTOM);
          } else {
            print(Date);
            var id = await _taskControler.addTask(Task(
                Date: Date,
                color: selectedColor,
                note: notes,
                title: title,
                completed: 0));
            print(id);
            Get.back();
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: primaryclr),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Text(label),
        ),
      ),
    );
  }
}
