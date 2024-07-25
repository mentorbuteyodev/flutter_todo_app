// important imports
import 'package:flutter/material.dart';
import 'package:todays_plan_2/settings/dimensions.dart';
import 'package:todays_plan_2/settings/outline_input_border.dart';
import 'package:todays_plan_2/settings/text.dart';
import 'package:todays_plan_2/theme/theme.dart';
import 'package:todays_plan_2/util/submit_button.dart';

class TextInputField extends StatefulWidget {
  final TextEditingController toDoController;
  final VoidCallback addToDo;
  const TextInputField({
    super.key,
    required this.toDoController,
    required this.addToDo,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // text input field
        Expanded(
          child: SizedBox(
            height: 45,
            child: TextField(
              controller: widget.toDoController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 2,
                ),
                filled: true,
                fillColor: kAccentColor,
                enabledBorder: toDoOutlineInputBorder(),
                focusedBorder: toDoOutlineInputBorder(),
                hintText: 'write your next task',
                hintStyle: toDoTextStyle(
                  fontSize: 18,
                  letterSpacing: 1.5,
                  height: 2.2,
                ),
              ),
              cursorColor: kSecondaryColors,
              cursorHeight: 30,
              textAlignVertical: TextAlignVertical.center,
              style: toDoInputStyle(
                height: 1.2,
              ),
            ),
          ),
        ),

        // 25 pixel wide
        kTwentyFiveW,

        // submit/add button
        SubmitButton(
          onTap: widget.addToDo,
        ),
      ],
    );
  }
}
