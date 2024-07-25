import 'package:flutter/material.dart';
import 'package:todays_plan_2/settings/text.dart';
import 'package:todays_plan_2/theme/theme.dart';

class InputButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;

  const InputButton({
    super.key,
    required this.buttonName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        // close the keyboard
        FocusScope.of(context).unfocus();
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: kAccentColorOne.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: toDoTextStyle(
              fontWeight: FontWeight.w800,
              color: kBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
