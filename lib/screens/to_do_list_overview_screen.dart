import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/themes/themes.dart';
import 'package:to_do_list_app/controllers/task_controller.dart';
import 'package:to_do_list_app/themes/themes.dart';
import 'package:to_do_list_app/providers/theme_services.dart';
import 'package:to_do_list_app/widgets/my_button.dart';
import 'package:to_do_list_app/widgets/task_bar.dart';
import 'package:to_do_list_app/widgets/task_tile.dart';

class ToDoListOverviewScreen extends StatefulWidget {
  static const routePage = '/to-do-list-screen';

  @override
  State<ToDoListOverviewScreen> createState() => _ToDoListOverviewScreenState();
}

class _ToDoListOverviewScreenState extends State<ToDoListOverviewScreen> {
  final _taskController = Get.put(TaskController());
  var date = DateFormat.yMd().format(DateTime.now());

  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        leading: GestureDetector(
          onTap: () {
            ThemeServices().switchTheme();
          },
          child: Icon(
            Icons.nightlight_outlined,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            size: 20,
          ),
        ),
        actions: const [
          Icon(
            Icons.person,
            size: 20,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: Themes().subHeadingStyle,
                    ),
                    Text(
                      'Today',
                      style: Themes().headingStyle,
                    )
                  ],
                )),
                MyButton('Add Task+', '', '',
                    DateFormat.yMd().format(DateTime.now()), 0)
              ],
            ),
          ),
          Container(
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
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey)),
              monthTextStyle: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey)),
              onDateChange: (selectedDate) {
                setState(() {
                  date = DateFormat.yMd().format(selectedDate).toString();
                });
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
              child: FutureBuilder(
                  future: _taskController.getTasks(date),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? Center(child: CircularProgressIndicator())
                          : FutureBuilder(
                              future: _taskController.getTasks(date),
                              builder:
                                  (context, snapshot) =>
                                      snapshot.connectionState ==
                                              ConnectionState.waiting
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : RefreshIndicator(
                                              onRefresh: () async {
                                                return _taskController
                                                    .getTasks(date)
                                                    .then((_) {
                                                  setState(() {});
                                                });
                                              },
                                              child: ListView.builder(
                                                itemBuilder: (context, index) {
                                                  return AnimationConfiguration
                                                      .staggeredList(
                                                          position: index,
                                                          child: SlideAnimation(
                                                            child:
                                                                FadeInAnimation(
                                                                    child: Row(
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Get.bottomSheet(
                                                                      Container(
                                                                          color: Get.isDarkMode
                                                                              ? Colors.grey[
                                                                                  600]
                                                                              : Colors
                                                                                  .white,
                                                                          padding: EdgeInsets.only(
                                                                              top:
                                                                                  4),
                                                                          height: _taskController.items[index].completed == 1
                                                                              ? MediaQuery.of(context).size.height *
                                                                                  0.24
                                                                              : MediaQuery.of(context).size.height *
                                                                                  0.32,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              GestureDetector(
                                                                                onTap: () async {
                                                                                  await _taskController.updateTable(_taskController.items[index].id, _taskController.items[index].completed).then((_) {
                                                                                    setState(() {});
                                                                                    Get.back();
                                                                                  });
                                                                                },
                                                                                child: Container(
                                                                                  alignment: Alignment.center,
                                                                                  width: double.infinity,
                                                                                  height: 50,
                                                                                  margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey), color: primaryclr),
                                                                                  child: Text(
                                                                                    _taskController.items[index].completed == 1 ? 'Undo Task' : 'Task completed',
                                                                                    style: Themes().titleStyle,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              GestureDetector(
                                                                                onTap: () async {
                                                                                  await _taskController.delete(_taskController.items[index]);
                                                                                  setState(() {});
                                                                                  Get.back();
                                                                                },
                                                                                child: Container(
                                                                                  alignment: Alignment.center,
                                                                                  width: double.infinity,
                                                                                  height: 50,
                                                                                  margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey), color: Colors.purpleAccent),
                                                                                  child: Text(
                                                                                    'Delete Task',
                                                                                    style: Themes().titleStyle,
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          )),
                                                                    );
                                                                  },
                                                                  child: TaskTile(
                                                                      _taskController
                                                                              .items[
                                                                          index]),
                                                                ),
                                                              ],
                                                            )),
                                                          ));
                                                },
                                                itemCount: _taskController
                                                    .items.length,
                                              ),
                                            ))))
        ],
      ),
    );
  }
}
