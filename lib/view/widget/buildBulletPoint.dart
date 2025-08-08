import 'package:flutter/material.dart';


class Bulletpoint extends StatelessWidget {
  const Bulletpoint({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(color: Color(0xFF333333))),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Color(0xFF333333)),
            ),
          ),
        ],
      ),
    );
  }
}
