import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLabels {
  // --- ESTILOS ORIGINALES (EXISTENTES) --- //
  static TextStyle h1 = GoogleFonts.roboto(
    fontSize: 30,
    fontWeight: FontWeight.w400,
  );

  static var h2; // Mantenido exactamente como estaba

  static var h3; // Mantenido exactamente como estaba

  static var subtitle; // Mantenido exactamente como estaba

  static var bodyText; // Mantenido exactamente como estaba

  // --- NUEVOS ESTILOS AÑADIDOS (MEJORAS) --- //
  static final TextStyle sectionTitle = GoogleFonts.roboto(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF1565C0), // Azul estándar
    letterSpacing: 1.2,
  );

  static final TextStyle cardTitle = GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF1976D2), // Azul claro
  );

  static final TextStyle bodyTextEnhanced = GoogleFonts.roboto(
    fontSize: 16,
    color: const Color(0xFF616161), // Gris medio
    height: 1.5,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle testimonialName = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF212121), // Casi negro
  );

  static final TextStyle buttonTextStyle = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final TextStyle footerTextStyle = GoogleFonts.roboto(
    fontSize: 14,
    color: const Color(0xB3FFFFFF), // Blanco con 70% opacidad
  );
}