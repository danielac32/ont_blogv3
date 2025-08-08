import 'package:flutter/material.dart';

import 'buildBulletPoint.dart';
import 'buildSection.dart';

class SectionGestion extends StatelessWidget {
  const SectionGestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      id: 'gestion',
      title: 'Nuestra Gestión',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'En ONT trabajamos en diversas líneas de acción para promover la transparencia y el buen gobierno:',
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Bulletpoint(
                    text: 'Monitoreo y evaluación de la transparencia institucional'),
                Bulletpoint(
                    text: 'Capacitación a funcionarios públicos y sociedad civil'),
                Bulletpoint(
                    text: 'Asesoría técnica a instituciones para mejorar sus sistemas de transparencia'),
                Bulletpoint(
                    text: 'Investigación aplicada sobre gobernanza y rendición de cuentas'),
                Bulletpoint(
                    text: 'Promoción de políticas públicas para el acceso a la información'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Nuestro trabajo ha impactado positivamente en más de 50 instituciones públicas a nivel nacional.',
          ),
        ],
      ),
    );
  }
}

