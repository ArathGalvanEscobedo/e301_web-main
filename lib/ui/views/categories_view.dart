import 'package:flutter/material.dart';
import 'package:e301_web/ui/cards/white_card.dart';
import 'package:e301_web/ui/labels/custom_labels.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  final List<Map<String, dynamic>> services = const [
    {
      'name': 'Impresión Digital',
      'description': 'Impresión a color y B/N en diversos formatos con calidad profesional',
      'icon': Icons.print,
      'color': Colors.blue,
    },
    {
      'name': 'Encuadernación',
      'description': 'Tesis, trabajos y documentos profesionales con acabados de lujo',
      'icon': Icons.book,
      'color': Colors.brown,
    },
    {
      'name': 'Diseño Gráfico',
      'description': 'Asesoría especializada en proyectos y presentaciones académicas',
      'icon': Icons.design_services,
      'color': Colors.purple,
    },
    {
      'name': 'Personalización',
      'description': 'Grabado láser y estampado de materiales para un toque único',
      'icon': Icons.create,
      'color': Colors.orange,
    },
    {
      'name': 'Entrega Express',
      'description': 'Servicio prioritario para cuando necesitas tus materiales urgentemente',
      'icon': Icons.delivery_dining,
      'color': Colors.green,
    },
    {
      'name': 'Kits Escolares',
      'description': 'Paquetes completos por grado escolar listos para usar',
      'icon': Icons.school,
      'color': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('SERVICIOS LUNA', style: CustomLabels.h1),
                  const SizedBox(height: 20),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: WhiteCard(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Text(
                              'En Papelería Luna no solo vendemos productos, ofrecemos soluciones completas para tus necesidades académicas y profesionales.',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          ...services.map((service) => _buildServiceCard(context, service)).toList(),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () => Navigator.pushNamed(context, '/dashboard/icons'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[800],
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            ),
                            child: const Text(
                              'Contáctanos para más información',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, Map<String, dynamic> service) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => _showServiceDetails(context, service),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: service['color']!.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: service['color']!.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: Icon(
                  service['icon'],
                  color: service['color'],
                  size: 30,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      service['description'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showServiceDetails(BuildContext context, Map<String, dynamic> service) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          service['name'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(service['icon'], size: 50, color: service['color']),
            const SizedBox(height: 16),
            Text(
              service['description'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              '¡Pregunta por nuestros paquetes especiales!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/dashboard/icons');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[800],
            ),
            child: const Text(
              'Contactar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}