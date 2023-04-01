import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/themes/themes.dart';
import 'package:to_do_list_app/widgets/my_button.dart';

import '../providers/theme_services.dart';

class AddTaskBar extends StatefulWidget {
  static const routePage = '/add-task-bar';

  @override
  State<AddTaskBar> createState() => _AddTaskBarState();
}

class _AddTaskBarState extends State<AddTaskBar> {
  DateTime _dateTime = DateTime.now();
  var _titleController = TextEditingController();
  var _notesController = TextEditingController();
  var _dateController = TextEditingController();
  var _selectedColor;
  @override
  void initState() {
    _titleController = TextEditingController();
    _notesController = TextEditingController();
    _dateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _notesController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.backgroundColor,
          leading: IconButton(
            icon: const Icon(
              Icons.navigate_before,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
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
        body: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Text(
                    'Add Task',
                    style: Themes().headingStyle,
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Title',
                              style: Themes().titleStyle,
                            ),
                            Container(
                              height: 52,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'enter title here',
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: context
                                                .theme.backgroundColor))),
                                controller: _titleController,
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Note',
                                        style: Themes().titleStyle,
                                      ),
                                      Container(
                                        height: 52,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 1),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: TextFormField(
                                          maxLines: 3,
                                          decoration: InputDecoration(
                                              hintText: 'enter your note',
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: context.theme
                                                          .backgroundColor))),
                                          controller: _notesController,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 16),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Date',
                                                style: Themes().titleStyle,
                                              ),
                                              Container(
                                                height: 52,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(8)),
                                                ),
                                                child: TextFormField(
                                                  maxLines: 3,
                                                  controller: _dateController,
                                                  decoration: InputDecoration(
                                                    icon: IconButton(
                                                      icon: const Icon(
                                                        Icons
                                                            .calendar_today_rounded,
                                                      ),
                                                      onPressed: () {
                                                        showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    DateTime
                                                                        .now(),
                                                                firstDate:
                                                                    DateTime(
                                                                        1912),
                                                                lastDate: DateTime
                                                                        .now()
                                                                    .add(Duration(
                                                                        days: 365 *
                                                                            7)))
                                                            .then((value) {
                                                          if (value == null) {
                                                            setState(() {
                                                              _dateTime =
                                                                  DateTime
                                                                      .now();
                                                            });
                                                          } else {
                                                            setState(() {
                                                              _dateTime = value;
                                                            });
                                                          }
                                                        });
                                                      },
                                                    ),
                                                    hintText: _dateTime == null
                                                        ? DateFormat.yMMMMd()
                                                            .format(
                                                                DateTime.now())
                                                        : DateFormat.yMMMMd()
                                                            .format(_dateTime),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: context
                                                                    .theme
                                                                    .backgroundColor)),
                                                  ),
                                                ),
                                              )
                                            ]), //
                                      )
                                    ]))
                          ])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Color',
                              style: Themes().titleStyle,
                            ),
                            Wrap(
                                children: List<Widget>.generate(
                                    3,
                                    (index) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _selectedColor = index;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: CircleAvatar(
                                              radius: 14,
                                              backgroundColor: index == 0
                                                  ? primaryclr
                                                  : index == 1
                                                      ? pinkclr
                                                      : yellowishclr,
                                              child: _selectedColor == index
                                                  ? Icon(
                                                      Icons.done,
                                                      color: Colors.black,
                                                      size: 14,
                                                    )
                                                  : Container(),
                                            ),
                                          ),
                                        )))
                          ],
                        ),
                      ),
                      Container(
                        child: MyButton(
                            'Create Task',
                            _titleController.text,
                            _notesController.text,
                            DateFormat.yMd().format(_dateTime),
                            _selectedColor),
                        margin: EdgeInsets.only(top: 50),
                      )
                    ],
                  )
                ]))));
  }
}
