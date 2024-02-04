import 'dart:ui';

/// Model representing a simple button with a label and callback
class SimpleButtonModel {
  /// Constructor
  SimpleButtonModel({
    required this.label,
    required this.onPressed,
  });

  /// The text label displayed on the button
  final String label;

  /// The callback invoked when the button is pressed
  final VoidCallback onPressed;
}
