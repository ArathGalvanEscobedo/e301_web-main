import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Envolver en un Expanded para que la imagen se
    //pueda ajustar adecuadamente al espacio dado
    return Expanded(
      child: Container(
        decoration: buildBoxDecoration(),
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Image(
                image: AssetImage('logo.png'),
                width: 500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    image: DecorationImage(
      image: AssetImage('PORTADA.jpg'),
      fit: BoxFit.cover,
    ),
  );
}