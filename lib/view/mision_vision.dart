import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

class MissionVisionSection extends StatelessWidget {
  const MissionVisionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título de la sección
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Somos ONT',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // GridView con las tarjetas
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height ),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              // Tarjeta Misión
              _buildAboutCard(
                title: 'Misión',
                content:
                "Como órgano rector técnico del Sistema de Tesorería, la función y gestión de la Oficina Nacional del Tesoro, se proyecta a los avances tecnológicos y la vocación de servicio público de su talento humano, a fin de lograr con eficacia y eficiencia, la administración de los recursos financieros que permitan cumplir oportunamente con los compromisos adquiridos por la República y las entidades político territoriales.",
              ),

              // Tarjeta Visión
              _buildAboutCard(
                title: 'Visión',
                content:
                "Ejercer rectoría técnica del Sistema de Tesorería, de acuerdo a los preceptos jurídicos y políticas macroeconómicas definidas por el gobierno nacional, para cumplir con los compromisos adquiridos por los órganos y entes de la República, y de las entidades político territoriales, de manera oportuna, transparente, eficaz y eficiente.",
              ),

              // Tarjeta Objetivo
              _buildAboutCard(
                title: 'Objetivo',
                content:
                "Contribuir al incremento de la eficiencia en la gestión de la Oficina Nacional del Tesoro, a través del acondicionamiento sistematizado e integral de su estructura organizativa, funciones, procesos y mecanismos de coordinación, a fin de maximizar el desarrollo de los planes y objetivos definidos, como rectora del Sistema de Tesorería.",
              ),

              // Tarjeta Valores
              _buildAboutCard(
                title: 'Valores',
                content: '''
                  Compromiso
                  Ética
                  Responsabilidad
                  Integridad
                  Lealtad
                  Equidad
                  Innovación
                  Respeto
                  ''',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget privado para construir cada tarjeta
  Widget _buildAboutCard({required String title, required String content}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFecf0f1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2c3e50),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: const TextStyle(
                color: Color(0xFF333333),
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}