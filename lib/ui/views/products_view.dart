import 'package:flutter/material.dart';
import 'package:e301_web/ui/cards/white_card.dart';
import 'package:e301_web/ui/labels/custom_labels.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  final List<Map<String, dynamic>> blogPosts = const [
    {
      'title': 'Organiza tus apuntes',
      'description': 'Técnicas para mantener tus notas ordenadas',
      'image': 'carpeta.png',
      'tip': 'Usa códigos de colores para categorizar tus apuntes por materias o temas.'
    },
    {
      'title': 'Materiales universitarios',
      'description': 'Lo esencial para tu vida académica',
      'image': 'cosas.jpg',
      'tip': 'Invierte en una buena agenda y marcadores de calidad para tus resúmenes.'
    },
    {
      'title': 'Técnicas de lettering',
      'description': 'Iníciate en el arte de la letra bonita',
      'image': 'marcadores.jpg',
      'tip': 'Practica trazos básicos diariamente durante 15 minutos para mejorar rápidamente.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con imagen y opacidad
          Opacity(
            opacity: 0.1,
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
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('BLOG CREATIVO', style: CustomLabels.h1),
                      const SizedBox(height: 10),
                      Text(
                        'Inspiración y recursos para tu vida académica',
                        style: CustomLabels.h2,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1000),
                        child: WhiteCard(
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.local_florist, color: Colors.pink, size: 30),
                                    SizedBox(width: 15),
                                    Text(
                                      'Explora Nuestros Artículos',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Icon(Icons.local_florist, color: Colors.pink, size: 30),
                                  ],
                                ),
                              ),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 0.8,
                                ),
                                itemCount: blogPosts.length,
                                itemBuilder: (context, index) {
                                  final post = blogPosts[index];
                                  return _buildBlogCard(context, post);
                                },
                              ),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/dashboard/orders');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue[800],
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  'Ver Productos',
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
        ],
      ),
    );
  }

  Widget _buildBlogCard(BuildContext context, Map<String, dynamic> post) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => _showTipDialog(context, post['title'], post['tip']),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  post['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['title'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post['description'],
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => _showTipDialog(context, post['title'], post['tip']),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Consejo útil'),
                          Icon(Icons.lightbulb_outline, size: 18),
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

  void _showTipDialog(BuildContext context, String title, String tip) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Consejo: $title"),
        content: Text(tip),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}