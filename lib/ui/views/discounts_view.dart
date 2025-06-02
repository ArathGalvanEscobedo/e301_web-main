import 'package:flutter/material.dart';

class DiscountsView extends StatelessWidget {
  const DiscountsView({super.key});

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Contáctate con nosotros',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.support_agent, size: 50, color: Colors.blue),
              SizedBox(height: 16),
              Text(
                'Si necesitas más información sobre nuestras promociones, nuestro equipo estará encantado de ayudarte.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            TextButton(
              child: const Text('Cerrar',
                  style: TextStyle(color: Colors.grey)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Ir a Contacto'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/dashboard/icons');
              },
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> discounts = [
      {
        'title': 'Descuento del 10%',
        'description': 'En todos los productos escolares seleccionados.',
        'icon': Icons.school,
        'color': Colors.blue,
        'valid': 'Válido hasta: 30/09/2023'
      },
      {
        'title': 'Promoción 2x1',
        'description': 'En materiales de arte los viernes por la tarde.',
        'icon': Icons.palette,
        'color': Colors.purple,
        'valid': 'Todos los viernes'
      },
      {
        'title': 'Envío gratis',
        'description': 'En compras mayores a \$500 en nuestra tienda online.',
        'icon': Icons.local_shipping,
        'color': Colors.green,
        'valid': 'Promoción permanente'
      },
      {
        'title': 'Día del estudiante',
        'description': '25% de descuento mostrando tu credencial estudiantil.',
        'icon': Icons.card_membership,
        'color': Colors.orange,
        'valid': '23 de mayo de cada año'
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF5F5F5), Color(0xFFE0E0E0)],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Preguntas Frecuentes sobre Promociones',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                itemCount: discounts.length,
                itemBuilder: (context, index) {
                  final discount = discounts[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: discount['color'] as Color,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    discount['icon'] as IconData,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    discount['title'] as String,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              discount['description'] as String,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                discount['valid'] as String,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showHelpDialog(context),
        icon: const Icon(Icons.help_outline),
        label: const Text('¿Necesitas ayuda?'),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 4,
      ),
    );
  }
}