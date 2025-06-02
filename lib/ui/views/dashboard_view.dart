import 'package:flutter/material.dart';
import 'package:e301_web/ui/cards/white_card.dart';
import 'package:e301_web/ui/labels/custom_labels.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blueAccent, Colors.white],
        ),
      ),
      child: ListView(
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text('PAPELERÍA LUNA', style: CustomLabels.h1),
                Text('Tu aliado en materiales escolares y de oficina', 
                     style: CustomLabels.h2),
                const SizedBox(height: 30),
                
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: WhiteCard(
                    child: Column(
                      children: [
                        // Sección Nosotros
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text('SOBRE NOSOTROS', style: CustomLabels.sectionTitle),
                              const SizedBox(height: 15),
                              Text(
                                'En Papelería Luna nos apasiona acompañarte en cada proyecto, ya sea académico, profesional o creativo. Fundada en 2010, nos hemos consolidado como líderes en el sector.',
                                textAlign: TextAlign.center,
                                style: CustomLabels.bodyTextEnhanced,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        
                        // Imagen
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'logo.png',
                            height: 450,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 40),
                        
                        // Sección de características
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  '¿POR QUÉ ELEGIRNOS?',
                                  style: CustomLabels.sectionTitle,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  _buildFeatureCard(
                                    icon: Icons.star,
                                    title: 'Calidad Garantizada',
                                    description: 'Productos de las mejores marcas',
                                    color: Colors.amber[600]!,
                                  ),
                                  const SizedBox(width: 20),
                                  _buildFeatureCard(
                                    icon: Icons.attach_money,
                                    title: 'Precios Competitivos',
                                    description: 'Ofertas especiales todo el año',
                                    color: Colors.green[600]!,
                                  ),
                                  const SizedBox(width: 20),
                                  _buildFeatureCard(
                                    icon: Icons.people,
                                    title: 'Atención Personalizada',
                                    description: 'Asesoramiento experto',
                                    color: Colors.blue[600]!,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        
                        // Testimonios
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'LO QUE DICEN NUESTROS CLIENTES',
                                style: CustomLabels.sectionTitle,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildTestimonialCard(
                                    name: 'Carlos Madrigal',
                                    comment: 'Excelente servicio y atención al cliente',
                                    initial: 'C',
                                  ),
                                  const SizedBox(width: 20),
                                  _buildTestimonialCard(
                                    name: 'Erick Mendoza',
                                    comment: 'Productos de calidad y buen precio',
                                    initial: 'E',
                                  ),
                                  const SizedBox(width: 20),
                                  _buildTestimonialCard(
                                    name: 'Esmeralda Delgado',
                                    comment: 'Siempre encuentro lo que necesito',
                                    initial: 'E',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        
                        // Llamado a la acción
                        Center(
                          child: Container(
                            width: 800,
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '¿LISTO PARA COMENZAR?',
                                  style: CustomLabels.sectionTitle.copyWith(
                                    color: Colors.white,
                                    fontSize: 28,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  'Visítanos hoy mismo y descubre por qué somos la papelería preferida',
                                  textAlign: TextAlign.center,
                                  style: CustomLabels.bodyTextEnhanced.copyWith(
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                ElevatedButton(
                                  onPressed: () => Navigator.pushNamed(context, '/dashboard/icons'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.blue[900],
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    textStyle: CustomLabels.buttonTextStyle,
                                  ),
                                  child: const Text('CONTÁCTANOS'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                
                // Footer
                Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.blue[900],
                  child: Column(
                    children: [
                      Text('PAPELERÍA LUNA', style: CustomLabels.footerTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                      const SizedBox(height: 10),
                      Text('Horario: L-V 8am-7pm | S 9am-2pm', 
                           style: CustomLabels.footerTextStyle),
                      Text('Teléfono: (555) 123-4567', 
                           style: CustomLabels.footerTextStyle),
                      const SizedBox(height: 20),
                      Text('© 2023 Papelería Luna', 
                           style: CustomLabels.footerTextStyle.copyWith(fontSize: 12)),
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

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(color: color.withOpacity(0.3), width: 2),
              ),
              child: Icon(icon, size: 30, color: color),
            ),
            const SizedBox(height: 15),
            Text(title, style: CustomLabels.cardTitle),
            const SizedBox(height: 10),
            Text(description, 
                 textAlign: TextAlign.center,
                 style: CustomLabels.bodyTextEnhanced),
          ],
        ),
      ),
    );
  }

  Widget _buildTestimonialCard({
    required String name,
    required String comment,
    required String initial,
  }) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[200],
            radius: 30,
            child: Text(
              initial,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(comment, 
               textAlign: TextAlign.center,
               style: CustomLabels.bodyTextEnhanced.copyWith(fontStyle: FontStyle.italic)),
          const SizedBox(height: 15),
          Text(name, style: CustomLabels.testimonialName),
          Text('Cliente satisfecho', 
               style: CustomLabels.bodyTextEnhanced.copyWith(fontSize: 14)),
        ],
      ),
    );
  }
}