import 'package:flutter/material.dart';
import 'package:unicon/ui/providers/theme.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    this.lable = 'SimpleButton',
    this.onPressed,
  });

  final String lable;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.white,
        side: const BorderSide(
          color: AppTheme.white,
          width: 0.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            1.0,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(lable),
    );
  }
}
