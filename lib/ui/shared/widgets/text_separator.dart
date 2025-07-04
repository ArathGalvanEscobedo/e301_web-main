import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSeparator extends StatelessWidget {
  final String text;

  const TextSeparator({
    super.key,
    required this.text, required Color color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      margin: EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 12,
          color: Colors.white.withAlpha(100),
        ),
      ),
    );
  }
}
