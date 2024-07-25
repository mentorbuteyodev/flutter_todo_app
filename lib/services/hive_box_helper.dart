import 'package:hive_flutter/hive_flutter.dart';
import 'package:todays_plan_2/model/model.dart';

class HiveBoxHelper {
  // create an instance of HiveBoxHelper
  static HiveBoxHelper boxRepoHive = HiveBoxHelper._internal();

  // return the static instance
  factory HiveBoxHelper() {
    return boxRepoHive;
  }

  // prevent external instantiation
  HiveBoxHelper._internal();

  // open Hive box for ToDoModel objects
  static Future<Box<ToDoModel>> openToDoBox() =>
      Hive.openBox<ToDoModel>('todo');
}
