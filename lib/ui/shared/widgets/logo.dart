import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10,),
          Text(
            'MENU',
            style: GoogleFonts.montserratAlternates(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
