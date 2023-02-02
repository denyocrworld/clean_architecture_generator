import 'package:flutter/material.dart';
import 'core.dart';

Widget debugView(context, child) {
  if (child == null) return Container();
  return Material(
    child: Stack(
      children: [
        child,
        Positioned(
          right: 36,
          bottom: 10,
          child: InkWell(
            onTap: () => Get.back(),
            child: const CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.blue,
            ),
          ),
        ),
        const Positioned(
          right: 10,
          bottom: 10,
          child: ThemeChangerIcon(),
        ),
      ],
    ),
  );
}
