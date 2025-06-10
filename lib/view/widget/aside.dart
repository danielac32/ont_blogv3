import 'package:flutter/material.dart';

import 'buildAsideSection.dart';
import 'buildNewsCard.dart';

class AsideWidget extends StatelessWidget {
  const AsideWidget({
    super.key,
    required List<Map<String, dynamic>> noticias,
  }) : _noticias = noticias;

  final List<Map<String, dynamic>> _noticias;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          // Noticias
          AsideSection(
            title: 'Últimas Noticias',
            child: Column(
              children: _noticias.map((noticia) {
                return NewsCard(noticia: noticia);
              }).toList(),
            ),
          ),

          // Suscripción
          AsideSection(
            title: 'Suscríbete',
            child: Column(
              children: [
                const Text(
                    'Recibe nuestras publicaciones y novedades directamente en tu correo.'),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Tu email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFe74c3c),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: const Text(
                    'Suscribirse',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}