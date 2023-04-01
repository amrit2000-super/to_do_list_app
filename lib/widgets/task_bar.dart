import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/controllers/task_controller.dart';
import 'package:to_do_list_app/themes/themes.dart';

class TaskBar extends StatefulWidget {
  @override
  State<TaskBar> createState() => _TaskBarState();
}

class _TaskBarState extends State<TaskBar> {
  static DateTime dateSelected = DateTime.now();
  var _taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryclr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey)),
        monthTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey)),
        onDateChange: (selectedDate) {
          setState(() {});
        },
      ),
    );
  }
}
