import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Centramos todo el contenido
      children: [
       
        const SizedBox(height: 20),
        FittedBox(
          fit: BoxFit.contain,
          child: Text('PAPELERIA LUNA',
            style: GoogleFonts.montserratAlternates(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        // Texto LOGIN centrado
        Align( // Widget adicional para asegurar el centrado
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text('LOGIN',
              style: GoogleFonts.montserratAlternates(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}