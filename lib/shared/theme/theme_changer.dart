

import 'package:flutter/material.dart';
import 'package:hyper_ui/shared/theme/theme.dart';
import 'package:hyper_ui/shared/theme/theme_dark.dart';

import '../../state_util.dart';

class ThemeChangerIcon extends StatefulWidget {
  const ThemeChangerIcon({Key? key}) : super(key: key);

  @override
  State<ThemeChangerIcon> createState() => _ThemeChangerIconState();
}

class _ThemeChangerIconState extends State<ThemeChangerIcon> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isDarkMode) {
          isDarkMode = !isDarkMode;
          Get.changeTheme(getDefaultTheme());
        } else {
          isDarkMode = !isDarkMode;
          Get.changeTheme(getDarkTheme());
        }
      },
      child: const CircleAvatar(
        radius: 8.0,
        backgroundColor: Colors.red,
      ),
    );
  }
}
