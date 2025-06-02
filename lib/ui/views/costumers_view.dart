import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  Future<void> _abrirUbicacion() async {
    const url = 'https://maps.app.goo.gl/8aheSYSxcu93oxzb7';
    
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication,
        );
      } else {
        throw 'No se pudo abrir la aplicación de mapas';
      }
    } catch (e) {
      debugPrint('Error al abrir maps: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Ubicación Papelería Luna'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'pama.png',
              width: 500,
              height: 400,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            const Text(
              '¡Visítanos en nuestra tienda!',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              'Av. Principal Melchor Ocampo 38, Irimbo Michoacan, México',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _abrirUbicacion,
              icon: const Icon(Icons.map),
              label: const Text('Cómo llegar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00008B), // Azul rey
                foregroundColor: Colors.white, // Color del texto e icono
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}