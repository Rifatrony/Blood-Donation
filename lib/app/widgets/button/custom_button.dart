import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  const CustomButton({
    super.key,
    required this.onPress,
    required this.title,
    this.backgroundColor, this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.blueAccent,
        foregroundColor: foregroundColor ?? Colors.white,
      ),
      child: Text(
        title,
        style: GoogleFonts.poppins(),
      ),
    );
  }
}
