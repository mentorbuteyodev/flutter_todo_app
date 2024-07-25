import 'package:flutter/material.dart';
import 'package:todays_plan_2/settings/dimensions.dart';
import 'package:todays_plan_2/settings/text.dart';
import 'package:todays_plan_2/theme/theme.dart';
import 'package:todays_plan_2/util/favorite_button.dart';

class TodoTile extends StatelessWidget {
  final String todo;
  final bool isComplete;
  final VoidCallback deleteToDo;
  final VoidCallback showToDoDialog;
  final void Function(bool?) handleCheckbox;
  const TodoTile({
    super.key,
    required this.todo,
    required this.isComplete,
    required this.deleteToDo,
    required this.showToDoDialog,
    required this.handleCheckbox,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      padding: const EdgeInsets.only(
        left: 10,
        right: 20,
      ),
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kAccentColor,
        border: Border.all(
          color: kSecondaryColors,
          width: 1.2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // checkbox and todo
          Row(
            children: [
              // checkbox
              Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  onChanged: handleCheckbox,
                  value: isComplete,
                  shape: const CircleBorder(),
                  side: BorderSide(
                    color: kAccentColorOne,
                  ),
                  activeColor: kAccentColorTwo,
                  checkColor: kAccentColorTwo,
                ),
              ),

              // 10 pixel wide
              kTenW,

              // to-do text
              Text(
                todo,
                style: toDoTextStyle(
                  fontWeight: FontWeight.w900,
                  decoration: isComplete
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),

          // edit and delete button
          Row(
            children: [
              // edit button
              FavoriteButton(
                onTap: showToDoDialog,
                imagePath: 'lib/icons/edit.png',
              ),

              // 10 pixel
              kTenW,

              // delete button
              FavoriteButton(
                onTap: deleteToDo,
                imagePath: 'lib/icons/delete.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
