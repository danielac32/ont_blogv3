import 'package:flutter/material.dart';


class AboutCardWidget extends StatelessWidget {
  AboutCardWidget({super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.05,
      //width: MediaQuery.of(context).size.width * 0.05,
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
              style: const TextStyle(color: Color(0xFF333333),fontStyle: FontStyle.italic),

            ),
          ],
        ),
      ),
    );
  }
}
