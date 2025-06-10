import 'package:flutter/material.dart';

import 'buildAboutCard.dart';
import 'buildSection.dart';

class SectionVisionMission extends StatelessWidget {
  const SectionVisionMission({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      id: 'somos',
      title: 'Somos ONT',
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height ),
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          AboutCardWidget(
              title: 'Misión',
              content: "Como órgano rector técnico del Sistema de Tesorería, la función y gestión de la Oficina Nacional del Tesoro, se proyecta a los avances tecnológicos y la vocación de servicio público de su talento humano, a fin de lograr con eficacia y eficiencia,la administración de los recursos financieros que permitan cumplir oportunamente con los compromisos adquiridos por la República y las entidades político territoriales."
          ),
          AboutCardWidget(
              title: 'Visión',
              content: "Ejercer rectoría técnica del Sistema de Tesorería, de acuerdo a los preceptos jurídicos y políticas macroeconómicas definidas por el gobierno nacional, para cumplir con los compromisos adquiridos por los órganos y entes de la República, y de las entidades político territoriales, de manera oportuna, transparente, eficaz y eficiente."
          ),
          AboutCardWidget(
              title: 'Objetivo',
              content: "Contribuir al incremento de la eficiencia en la gestión de la Oficina Nacional del Tesoro, a través del acondicionamiento sistematizado e integral de su estructura organizativa, funciones, procesos y mecanismos de coordinación, a fin de maximizar el desarrollo de los planes y objetivos definidos, como rectora del Sistema de Tesorería."
          ),
          AboutCardWidget(
            title: 'Valores',
            content:
            '''
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
    );
  }
}
