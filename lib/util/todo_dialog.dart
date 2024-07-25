import 'package:flutter/material.dart';
import 'package:todays_plan_2/settings/dimensions.dart';
import 'package:todays_plan_2/settings/outline_input_border.dart';
import 'package:todays_plan_2/settings/text.dart';
import 'package:todays_plan_2/theme/theme.dart';
import 'package:todays_plan_2/util/input_button.dart';

class ToDoDialog extends StatelessWidget {
  final VoidCallback editToDo;
  final VoidCallback cancelToDo;
  final TextEditingController toDoController;
  const ToDoDialog({
    super.key,
    required this.editToDo,
    required this.cancelToDo,
    required this.toDoController,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kBackgroundColor,
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        padding: const EdgeInsets.all(20),
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          border: Border.all(
            color: kSecondaryColors,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // text input
            SizedBox(
              height: 50,
              width: 250,
              child: TextField(
                controller: toDoController,
                cursorColor: kSecondaryColors,
                cursorHeight: 30,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  filled: true,
                  fillColor: kAccentColor,
                  enabledBorder: toDoOutlineInputBorder(borderRadius: 12),
                  focusedBorder: toDoOutlineInputBorder(borderRadius: 12),
                ),
                style: toDoInputStyle(
                  height: 1.2,
                ),
              ),
            ),

            // edit - cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // edit button
                InputButton(
                  buttonName: 'Update',
                  onTap: editToDo,
                ),

                // 20 pixel
                kTwentyW,

                // cancel button
                InputButton(
                  buttonName: 'Cancel',
                  onTap: cancelToDo,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
