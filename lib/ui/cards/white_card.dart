import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhiteCard extends StatelessWidget {
  final String? title;
  final Widget child;
  final double? width;
  final TextStyle? titleStyle;
  final bool centerTitle;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool showDivider;

  const WhiteCard({
    super.key,
    this.title,
    required this.child,
    this.width,
    this.titleStyle,
    this.centerTitle = false,
    this.margin = EdgeInsets.zero, // Elimina márgenes por defecto
    this.padding = EdgeInsets.zero, // Elimina padding por defecto
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      padding: padding,
      decoration: buildBoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Elimina espacio extra
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null) ...[
            centerTitle
                ? Center(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        title!,
                        style: titleStyle ?? GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : Text(
                    title!,
                    style: titleStyle ?? GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            if (showDivider) const Divider(height: 1, thickness: 1),
          ],
          child,
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha(10),
        blurRadius: 5,
      ),
    ],
  );
}