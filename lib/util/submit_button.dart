import 'package:flutter/material.dart';
import 'package:todays_plan_2/settings/text.dart';
import 'package:todays_plan_2/theme/theme.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onTap;
  const SubmitButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: kAccentColorOne,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Center(
          child: Text(
            '+',
            style: toDoTextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: kBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
