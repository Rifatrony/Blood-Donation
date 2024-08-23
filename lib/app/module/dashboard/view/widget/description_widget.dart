import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class DescriptionWidget extends StatelessWidget {
  final String title;
  final String value;
  final FontWeight? titleFontWeight;
  final FontWeight? valueFontWeight;
  final TextDecoration? textDecoration;
  final bool? isBorder;
  const DescriptionWidget({
    super.key,
    required this.title,
    required this.value,
    this.titleFontWeight,
    this.valueFontWeight,
    this.textDecoration,
    this.isBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal, fontSize: 11.5),
          ),
          Container(
            padding: isBorder == true ? const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 2
            ) : EdgeInsets.zero,
            decoration: BoxDecoration(
              border: isBorder == true ? Border.all(width: 0.5, color: Colors.grey) : null,
              borderRadius: BorderRadius.circular(2)
            ),
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontWeight: valueFontWeight ?? FontWeight.normal,
                fontSize: 12.5,
                decoration: textDecoration ?? TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
