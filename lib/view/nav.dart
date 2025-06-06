
import 'package:flutter/material.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({super.key, required this.text, required this.link});
  final String text;
  final String link;

  @override
  Widget build(BuildContext context) {
    return _buildNavItem(text,link);
  }

  Widget _buildNavItem(String text, String link) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF2c3e50),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}



