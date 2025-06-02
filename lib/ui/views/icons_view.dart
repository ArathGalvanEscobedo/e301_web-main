import 'package:flutter/material.dart';
import 'package:e301_web/ui/cards/white_card.dart';
import 'package:e301_web/ui/labels/custom_labels.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con opacidad baja
          Opacity(
            opacity: 0.2,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100]?.withOpacity(
                    0.3,
                  ), // Azul cielo con 30% opacidad
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blue.withOpacity(0.5),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'CONTÁCTANOS',
                      style:
                          CustomLabels.h1?.copyWith(
                            color: Colors.blue[800],
                            fontSize: 36,
                          ) ??
                          const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                    ),
                    const SizedBox(height: 40),

                    // Información de contacto
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Colors.green,
                              size: 28,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '786 123 4567',
                              style:
                                  CustomLabels.h2?.copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ) ??
                                  const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.email,
                              color: Colors.red,
                              size: 28,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'papelerialuna@gmail.com',
                              style:
                                  CustomLabels.h2?.copyWith(fontSize: 20) ??
                                  const TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // Línea divisoria
                    Container(
                      height: 2,
                      width: 200,
                      color: Colors.grey[300],
                      margin: const EdgeInsets.symmetric(vertical: 20),
                    ),

                    // Contenido principal centrado
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          // Tarjeta de ubicación con botón
                          WhiteCard(
                            title: 'Ubicación',
                            width: 280,
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 15,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/dashboard/custumers',
                                    );
                                  },
                                  child: const Text(
                                    'Ver Ubicación',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),

                          const SizedBox(height: 30),

                          // Tarjeta de horario
                          WhiteCard(
                            title: 'Horario de Atención',
                            width: 280,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  const Text(
                                    'Lunes a Viernes\n8:00 AM - 7:00 PM',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Icon(
                                    Icons.access_time,
                                    size: 40,
                                    color: Colors.orange[700],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
