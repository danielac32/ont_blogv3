

import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     // color: const Color(0xFF2c3e50),
      //padding: const EdgeInsets.all(40),
      padding: const EdgeInsets.fromLTRB(40, 24, 40, 24),
      child: Column(
        children: [
          //SizedBox(height: 100,),
          _FooterGrid(),
          const _FooterDivider(),
          const _CopyrightText(),
        ],
      ),
    );
  }
}





class _FooterGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: _getColumnCount(context),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 20,
      mainAxisSpacing: 8,
      childAspectRatio: _getChildAspectRatio(context),
      children: const [
        _OntInfoColumn(),
        _LinksColumn(title: 'Enlaces', links: [
          'Somos ONT',
          'Publicaciones',
          'Gestión',
          'Contáctanos',
        ]),
        _LinksColumn(title: 'Publicaciones', links: [
          'Informes anuales',
          'Estudios',
          'Guías prácticas',
          'Documentos de trabajo',
        ]),
        _ContactColumn(),
      ],
    );
  }

  int _getColumnCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return 4;
    if (width > 800) return 2;
    return 1;
  }

  double _getChildAspectRatio(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return 1.5;
    if (width > 800) return 1.2;
    return 1.8;
  }
}

class _OntInfoColumn extends StatelessWidget {
  const _OntInfoColumn();

  @override
  Widget build(BuildContext context) {
    return _FooterColumn(
      title: 'ONT',
      children: [
        const Text(
          'Organización comprometida con la transparencia, el acceso a la información y el buen gobierno.',
          style: _footerTextStyle,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _SocialIcon(icon: 'f'),
            const SizedBox(width: 8),
            _SocialIcon(icon: 't'),
            const SizedBox(width: 8),
            _SocialIcon(icon: 'in'),
            const SizedBox(width: 8),
            _SocialIcon(icon: 'y'),
          ],
        ),
      ],
    );
  }
}

class _LinksColumn extends StatelessWidget {
  final String title;
  final List<String> links;

  const _LinksColumn({required this.title, required this.links});

  @override
  Widget build(BuildContext context) {
    return _FooterColumn(
      title: title,
      children: [
        for (final link in links)
          _FooterLink(text: link),
      ],
    );
  }
}

class _ContactColumn extends StatelessWidget {
  const _ContactColumn();

  @override
  Widget build(BuildContext context) {
    return _FooterColumn(
      title: 'Contacto',
      children: const [
        //Text('Av. Tran', style: _footerTextStyle),
        Text('info@ont.gob.ve', style: _footerTextStyle),
        Text('(0212) 234-5678', style: _footerTextStyle),
        Text('Lunes a Viernes: 9am - 5pm', style: _footerTextStyle),
      ],
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _FooterColumn({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 40,
              height: 3,
              color: const Color(0xFFe74c3c),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const _FooterLink({required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: _footerTextStyle,
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final String icon;
  final VoidCallback? onTap;

  const _SocialIcon({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0x1AFFFFFF),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            icon,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterDivider extends StatelessWidget {
  const _FooterDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0x1AFFFFFF),
      height: 24,
      thickness: 1,
    );
  }
}

class _CopyrightText extends StatelessWidget {
  const _CopyrightText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '© 2024 ONT - Oficina Nacional del Tesoro',
      style: TextStyle(
        color: Color(0xFFbdc3c7),
        fontSize: 12,
      ),
    );
  }
}

const _footerTextStyle = TextStyle(color: Color(0xFFbdc3c7));