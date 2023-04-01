import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_list_app/themes/themes.dart';

class ThemeServices {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  _saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);
  ThemeMode get currentTheme =>
      _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveTheme(!_loadThemeFromBox());
  }
}
