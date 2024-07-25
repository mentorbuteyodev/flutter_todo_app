// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todays_plan_2/model/model.dart';
import 'package:todays_plan_2/services/hive_box_helper.dart';

class HiveServiceProvider extends ChangeNotifier {
  // empty list to store todo's
  List<ToDoModel> _toDoList = [];

  // get the todo list
  List<ToDoModel> get toDoList => _toDoList;

// open hive box for ToDoModel objects
  Future<Box<ToDoModel>> _openToDoBox() async {
    return await HiveBoxHelper.openToDoBox();
  }

  // get todo's
  void getToDo() async {
    // open hive box
    Box<ToDoModel> openBox = await _openToDoBox();

    // retrieve all ToDoModel objects
    // from the hive box, and convert them to a list
    _toDoList = openBox.values.toList();

    // notify listeners (widget) of changes in data
    notifyListeners();
  }

  // add todo's
  void addToDo(ToDoModel newToDo) async {
    // open hive box
    Box<ToDoModel> openBox = await _openToDoBox();

    // add new todo
    openBox.add(newToDo);

    // notify listeners (widgets) of changes in data
    notifyListeners();

    // get all the data
    getToDo();
  }

  // delete todo's
  void deleteToDo(int index) async {
    // open hive box
    Box<ToDoModel> openBox = await _openToDoBox();

    // delete the specified todo
    openBox.deleteAt(index);

    // notify listeners (widget) of changes in data
    notifyListeners();

    // get all the data
    getToDo();
  }

  // edit todo's
  void editToDo(int index, ToDoModel toDoItem) async {
    // open hive box
    Box<ToDoModel> openBox = await _openToDoBox();

    // edit specified todo
    openBox.putAt(
      index,
      toDoItem,
    );

    // notify listeners (widgets) of changes in data
    notifyListeners();

    // get all the data
    getToDo();
  }

  // handle checkBox
  void handleCheckBox(int index) async {
    // open hive box
    Box<ToDoModel> openBox = await _openToDoBox();

    // if the task is complete
    // set it to incomplete and vise versa
    if (toDoList[index].isComplete) {
      // set to incomplete
      openBox.putAt(
        index,
        ToDoModel(toDoList[index].todo, false),
      );
    } else {
      // set to complete
      openBox.putAt(
        index,
        ToDoModel(toDoList[index].todo, true),
      );
    }

    // notify listeners (widgets) of changes in data
    notifyListeners();

    // get the updated data
    getToDo();
  }
}
