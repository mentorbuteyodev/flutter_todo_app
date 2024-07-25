import 'package:flutter/material.dart';
import 'package:todays_plan_2/theme/theme.dart';

class FavoriteButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  const FavoriteButton({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 35,
        width: 35,
        child: Image.asset(
          imagePath,
          color: kSecondaryColors.withOpacity(0.8),
        ),
      ),
    );
  }
}
