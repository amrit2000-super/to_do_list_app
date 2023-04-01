import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/providers/theme_services.dart';
import 'package:to_do_list_app/screens/add_task_bar.dart';
import 'package:to_do_list_app/screens/to_do_list_overview_screen.dart';
import 'package:to_do_list_app/themes/themes.dart';
import 'package:to_do_list_app/database/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initDb();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().currentTheme,
      home: ToDoListOverviewScreen(),
      routes: {AddTaskBar.routePage: (context) => AddTaskBar()},
    );
  }
}
