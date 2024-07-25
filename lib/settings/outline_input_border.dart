import 'package:flutter/material.dart';

OutlineInputBorder toDoOutlineInputBorder({double? borderRadius}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 20),
      borderSide: BorderSide.none,
    );
