import 'package:flutter/material.dart';
import 'package:e301_web/ui/cards/white_card.dart';
import 'package:e301_web/ui/labels/custom_labels.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  // Lista completa de productos con descripciones detalladas
  final List<Map<String, String>> products = const [
    {
      'image': 'saca.jpeg',
      'title': 'Libreta Profesional',
      'description': 'Libreta tamaño carta con tapa dura en diversos colores. Ideal para tomar apuntes, con hojas de alta calidad que resisten el uso diario. Incluye separadores y bolsillo interior para documentos.'
    },
    {
      'image': 'grapas.jpeg',
      'title': 'Engrapadora Industrial',
      'description': 'Engrapadora metálica de alta resistencia, capacidad para 100 grapas. Diseño ergonómico con base antideslizante. Perfecta para oficinas con alto volumen de trabajo.'
    },
    {
      'image': 'carpeta.png',
      'title': 'Carpetas Multiusos',
      'description': 'Set de 5 carpetas organizadoras en colores vibrantes. Fabricadas en polipropileno duradero con etiquetas para identificación. Incluyen anillos metálicos para mayor seguridad de tus documentos.'
    },
    {
      'image': 'lapices.jpg',
      'title': 'Lápices de Colores Premium',
      'description': 'Paquete de 24 lápices de colores surtidos con mina resistente a la rotura. Pigmentos intensos que no manchan las manos. Incluye afilador integrado en el estuche de metal.'
    },
    {
      'image': 'marcadores.jpg',
      'title': 'Marcadores Profesionales',
      'description': 'Set de 12 marcadores permanentes de punta fina y gruesa. Tinta a base de alcohol que no traspasa el papel. Ideales para proyectos artísticos, rotulación y trabajos de oficina.'
    },
    {
      'image': 'calculadora.jpg',
      'title': 'Calculadora Científica Avanzada',
      'description': 'Calculadora con 240 funciones, pantalla LCD de alta resolución y alimentación solar/batería. Incluye funda protectora y manual en español. Perfecta para estudiantes de ingeniería y matemáticas.'
    },
    {
      'image': 'tijeras.jpg',
      'title': 'Tijeras Profesionales',
      'description': 'Tijeras de acero inoxidable japonés con mango ergonómico anti-fatiga. Corte preciso para papel, cartulina y materiales craft. Diseño ambidiestro con garantía de por vida.'
    },
    {
      'image': 'pegamento.jpg',
      'title': 'Pegamento Multisuperficies',
      'description': 'Pegamento líquido de secado rápido (30 segundos) para papel, cartón, tela y madera. Presentación en frasco con aplicador preciso. No tóxico y lavable en herramientas.'
    },
    {
      'image': 'regla.jpg',
      'title': 'Regla Profesional',
      'description': 'Regla de acero inoxidable de 30 cm con grabado láser en cm/pulgadas. Borde antideslizante y resistencia a impactos. Incluye nivel de burbuja integrado para trabajos técnicos.'
    },
  ];

  // Variable para controlar el hover
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Center(
            child: Text(
              'PRODUCTOS PAPELERÍA LUNA',
              style: CustomLabels.h1,
            ),
          ),
          const SizedBox(height: 30),
          WhiteCard(
            child: Column(
              children: [
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return _buildProductCard(products[index], index);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, String> product, int index) {
    final isHovered = _hoveredIndex == index;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = null),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1.0),
        child: Card(
          elevation: isHovered ? 10 : 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12)),
                  child: Image.asset(
                    product['image']!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color.fromARGB(255, 143, 142, 142),
                        child: const Center(
                          child: Icon(Icons.image_not_supported, size: 50),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product['description']!,
                      style: const TextStyle(fontSize: 14),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}