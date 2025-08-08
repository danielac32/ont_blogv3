import 'package:flutter/material.dart';

import 'buildPublicacionCard.dart';
import 'buildSection.dart';

class SectionPublications extends StatelessWidget {
  const SectionPublications({
    super.key,
    required List<Map<String, dynamic>> publicaciones,
  }) : _publicaciones = publicaciones;

  final List<Map<String, dynamic>> _publicaciones;

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      id: 'publicaciones',
      title: 'Publicaciones Recientes',
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.36,
        child: GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: _publicaciones.map((publicacion) {
            return PublicacionCardWidget(publicacion: publicacion,);
          }).toList(),
        ),
      ),
    );
  }
}