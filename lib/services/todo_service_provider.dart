import 'package:flutter/material.dart';
import 'package:todays_plan_2/extensions/extensions.dart';
import 'package:todays_plan_2/model/model.dart';
import 'package:todays_plan_2/util/todo_dialog.dart';

class ToDoServiceProvider {
  // add new todo controller
  static final TextEditingController _controllerAddToDo =
      TextEditingController();
  // edit todo controller
  static final TextEditingController _controllerEditToDo =
      TextEditingController();

  // get add new todo controller
  static TextEditingController get controllerAddToDo => _controllerAddToDo;

  // add new todo
  static void addNewToDo(
    var backEnd,
    BuildContext context,
  ) {
    // check if the input is empty
    // and if its >= 3
    if (_controllerAddToDo.text.isNotEmpty &&
        _controllerAddToDo.text.length >= 3) {
      backEnd.addToDo(ToDoModel(_controllerAddToDo.text, false));

      // clear input
      _controllerAddToDo.clear();

      // close the keyboard
      FocusScope.of(context).unfocus();
    }
  }

  // cancel todo
  static void cancelToDo(
    BuildContext context,
  ) {
    debugPrint('Todo Cancelled');
    // close the keyboard
    FocusScope.of(context).unfocus();
    // clear controller
    _controllerEditToDo.clear();
    // pop off the screen
    Navigator.of(context).pop();
  }

  // edit todo
  static void editToDo({
    required var backEnd,
    required int index,
    required BuildContext context,
  }) {
    debugPrint('Todo Edited');
    // check to make sure
    // text input is not empty
    // and text length is >= 3
    if (_controllerEditToDo.text.isNotEmpty &&
        _controllerEditToDo.text.length >= 3) {
      backEnd.editToDo(
        index,
        ToDoModel(
          _controllerEditToDo.text,
          false,
        ),
      );

      // pop off the screen
      Navigator.of(context).pop();
    }
  }

  // show todo Dialog
  static void showToDoDialog({
    required String todo,
    required BuildContext context,
    required void Function(void Function() fn) setState,
    required int index,
    required var backEnd,
  }) {
    _controllerEditToDo.text = todo.capitalizeSentence();
    debugPrint('Showing Todo Dialog');
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => ToDoDialog(
        editToDo: () => editToDo(
          index: index,
          backEnd: backEnd,
          context: context,
        ),
        cancelToDo: () => cancelToDo(
          context,
        ),
        toDoController: _controllerEditToDo,
      ),
    );

    setState(() {});
  }
}
