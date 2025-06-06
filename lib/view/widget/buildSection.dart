import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final String? id; // opcional, para scroll o anclas

  const SectionWidget({
    super.key,
    required this.title,
    required this.child,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //key: id != null ? ValueKey(id) : null,
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2c3e50),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 60,
            height: 3,
            color: Color(0xFFe74c3c),
          ),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }
}