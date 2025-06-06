import 'package:flutter/material.dart';
import 'package:ont_blog_v3/view/carrusel.dart';
import 'package:ont_blog_v3/view/mision_vision.dart';
import 'package:ont_blog_v3/view/widget/buildAboutCard.dart';
import 'package:ont_blog_v3/view/widget/buildBulletPoint.dart';
import 'package:ont_blog_v3/view/widget/buildPublicacionCard.dart';
import 'package:ont_blog_v3/view/widget/buildSection.dart';

void main() {
  runApp(const OntApp());
}

class OntApp extends StatelessWidget {
  const OntApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ONT - Organización Nacional de Transparencia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF2c3e50),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF3498db),
          primary: const Color(0xFF2c3e50),
        ),
        fontFamily: 'Segoe UI',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentCarouselIndex = 0;
  int _currentGestionIndex = 0;
  final PageController _carouselController = PageController();
  final PageController _gestionController = PageController();

  final List<Map<String, dynamic>> _carouselItems = [
    {
      'title': 'Transparencia y Buen Gobierno',
      'description': 'Promovemos la transparencia en la gestión pública y el acceso a la información como pilares fundamentales de la democracia.',
      'image': 'assets/6.jpeg',
      'buttonText': 'Conócenos',
    },
    {
      'title': 'Nuestras Publicaciones',
      'description': 'Accede a nuestros informes, estudios y análisis sobre transparencia, rendición de cuentas y buen gobierno.',
      'image': 'assets/1.jpeg',
      'buttonText': 'Ver publicaciones',
    },
    {
      'title': 'Participa con Nosotros',
      'description': 'Únete a nuestra red de voluntarios o colabora con nuestras iniciativas para promover la transparencia.',
      'image': 'assets/2.jpeg',
      'buttonText': 'Contáctanos',
    },
  ];

  final List<Map<String, dynamic>> _gestionItems = [
    {
      'title': 'Impacto de Nuestro Trabajo',
      'description': 'En el último año, hemos capacitado a más de 500 funcionarios públicos en temas de transparencia y acceso a la información, contribuyendo a mejorar los índices de cumplimiento en un 35%.',
      'image': 'https://images.unsplash.com/photo-1521791055366-0d553872125f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      'buttonText': 'Ver informe completo',
    },
    {
      'title': 'Reconocimientos Internacionales',
      'description': 'Nuestra metodología de evaluación de portales de transparencia ha sido destacada por la Alianza para el Gobierno Abierto como una de las más completas de la región.',
      'image': 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      'buttonText': 'Conocer más',
    },
    {
      'title': 'Alianzas Estratégicas',
      'description': 'Trabajamos en coordinación con 15 organizaciones de la sociedad civil, universidades y organismos internacionales para promover la agenda de transparencia en el país.',
      'image': 'https://images.unsplash.com/photo-1521737711867-e3b97375f902?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      'buttonText': 'Ver aliados',
    },
  ];

  final List<Map<String, dynamic>> _noticias = [
    {
      'fecha': '20 Abril, 2024',
      'titulo': 'ONT presenta informe sobre contrataciones públicas',
      'resumen': 'Análisis revela avances y desafíos en transparencia de procesos de compra estatal.',
    },
    {
      'fecha': '5 Abril, 2024',
      'titulo': 'Capacitación a periodistas en acceso a información',
      'resumen': 'Talleres prácticos para fortalecer el uso de herramientas de transparencia en el ejercicio periodístico.',
    },
    {
      'fecha': '22 Marzo, 2024',
      'titulo': 'Alianza con universidades para investigación',
      'resumen': 'Convenio permitirá desarrollar estudios conjuntos sobre gobernanza y transparencia.',
    },
    {
      'fecha': '10 Marzo, 2024',
      'titulo': 'Reconocimiento a mejor portal de transparencia',
      'resumen': 'Premiación anual a las instituciones con mejores prácticas en publicación de información pública.',
    },
  ];

  final List<Map<String, dynamic>> _publicaciones = [
    {
      'titulo': 'Informe Anual de Transparencia 2023',
      'fecha': '15 Marzo, 2024',
      'categoria': 'Informes',
      'imagen': 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      'resumen': 'Análisis comparativo del nivel de transparencia en las instituciones públicas nacionales.',
    },
    {
      'titulo': 'Guía de Acceso a la Información Pública',
      'fecha': '28 Febrero, 2024',
      'categoria': 'Guías',
      'imagen': 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      'resumen': 'Manual práctico para ejercer el derecho de acceso a la información en instituciones públicas.',
    },
    {
      'titulo': 'Estudio: Transparencia Municipal',
      'fecha': '10 Enero, 2024',
      'categoria': 'Estudios',
      'imagen': 'https://images.unsplash.com/photo-1434626881859-194d67b2b86f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
      'resumen': 'Evaluación comparativa de los portales de transparencia de los gobiernos locales.',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Auto-rotate carousels
    _startCarouselTimer();
    _startGestionTimer();
  }

  void _startCarouselTimer() {
    Future.delayed(const Duration(seconds: 5), () {
      if (_carouselController.hasClients) {
        if (_currentCarouselIndex < _carouselItems.length - 1) {
          _carouselController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        } else {
          _carouselController.animateToPage(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }
        _startCarouselTimer();
      }
    });
  }

  void _startGestionTimer() {
    Future.delayed(const Duration(seconds: 6), () {
      if (_gestionController.hasClients) {
        if (_currentGestionIndex < _gestionItems.length - 1) {
          _gestionController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        } else {
          _gestionController.animateToPage(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }
        _startGestionTimer();
      }
    });
  }

  @override
  void dispose() {
    _carouselController.dispose();
    _gestionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Cintillo.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
         */
        title: const Text('ONT.', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2c3e50))),
        actions: [
          _buildNavItem('Somos ONT', '#somos'),
          _buildNavItem('Publicaciones', '#publicaciones'),
          _buildNavItem('Gestión', '#gestion'),
          _buildNavItem('Contáctanos', '#contacto'),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Carrusel principal


            CarouselWidget(
              carouselController: _carouselController,
              carouselItems: _carouselItems,
              onPageChanged: (index) {
                setState(() {
                  _currentCarouselIndex = index;
                });
              },
              currentCarouselIndex: _currentCarouselIndex,
              height: 500, // Opcional, por defecto es 500
            ),
            /*
            SizedBox(
              height: 500,
              child: PageView.builder(
                controller: _carouselController,
                itemCount: _carouselItems.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentCarouselIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(_carouselItems[index]['image']),//NetworkImage(_carouselItems[index]['image']),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),*/
            const SizedBox(height: 24),

            // Contenido principal
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Contenido principal
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        // Sección Somos ONT
                        //MissionVisionSection(),
                        SectionWidget(
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
                        ),

                        // Sección Publicaciones
                        SectionWidget(
                          id: 'publicaciones',
                          title: 'Publicaciones Recientes',
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

                        // Sección Gestión
                        SectionWidget(
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
                        ),

                        // Sección Contacto
                       /* SectionWidget(
                          id: 'contacto',
                          title: 'Contáctanos',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Estamos para atender tus consultas, sugerencias o propuestas de colaboración.'),
                              const SizedBox(height: 24),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Nombre',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Mensaje',
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: 5,
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFe74c3c),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                ),
                                child: const Text(
                                  'Enviar Mensaje',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),*/
                      ],
                    ),
                  ),

                  // Aside
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        // Noticias
                        _buildAsideSection(
                          title: 'Últimas Noticias',
                          child: Column(
                            children: _noticias.map((noticia) {
                              return _buildNewsCard(noticia);
                            }).toList(),
                          ),
                        ),

                        // Suscripción
                        _buildAsideSection(
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
                  ),
                ],
              ),
            ),

            // Carrusel de gestión
            Container(
              color: const Color(0xFF2c3e50),
              padding: const EdgeInsets.symmetric(vertical: 48),
              margin: const EdgeInsets.symmetric(vertical: 48),
              child: SizedBox(
                height: 400,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _gestionController,
                        itemCount: _gestionItems.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentGestionIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _gestionItems[index]['title'],
                                        style: const TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        _gestionItems[index]['description'],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFe74c3c),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 24,
                                            vertical: 12,
                                          ),
                                        ),
                                        child: Text(
                                          _gestionItems[index]['buttonText'],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Image.network(
                                    _gestionItems[index]['image'],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _gestionItems.length,
                        (index) => GestureDetector(
                          onTap: () {
                            _gestionController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentGestionIndex == index
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            Container(
              color: const Color(0xFF2c3e50),
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 20,
                    children: [
                      _buildFooterColumn(
                        title: 'ONT',
                        children: [
                          const Text(
                            'Organización comprometida con la transparencia, el acceso a la información y el buen gobierno.',
                            style: TextStyle(color: Color(0xFFbdc3c7))),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              _buildSocialIcon('f'),
                              const SizedBox(width: 8),
                              _buildSocialIcon('t'),
                              const SizedBox(width: 8),
                              _buildSocialIcon('in'),
                              const SizedBox(width: 8),
                              _buildSocialIcon('y'),
                            ],
                          ),
                        ],
                      ),
                      _buildFooterColumn(
                        title: 'Enlaces',
                        children: [
                          _buildFooterLink('Somos ONT'),
                          _buildFooterLink('Publicaciones'),
                          _buildFooterLink('Gestión'),
                          _buildFooterLink('Contáctanos'),
                        ],
                      ),
                      _buildFooterColumn(
                        title: 'Publicaciones',
                        children: [
                          _buildFooterLink('Informes anuales'),
                          _buildFooterLink('Estudios'),
                          _buildFooterLink('Guías prácticas'),
                          _buildFooterLink('Documentos de trabajo'),
                        ],
                      ),
                      _buildFooterColumn(
                        title: 'Contacto',
                        children: [
                          const Text('Av. Transparencia 123, Lima',
                              style: TextStyle(color: Color(0xFFbdc3c7))),
                          const Text('info@ont.org.pe',
                              style: TextStyle(color: Color(0xFFbdc3c7))),
                          const Text('(01) 234-5678',
                              style: TextStyle(color: Color(0xFFbdc3c7))),
                          const Text('Lunes a Viernes: 9am - 5pm',
                              style: TextStyle(color: Color(0xFFbdc3c7))),
                        ],
                      ),
                    ],
                  ),
                  const Divider(color: Color(0x1AFFFFFF), height: 40),
                  const Text(
                    '© 2024 ONT - Organización Nacional de Transparencia. Todos los derechos reservados.',
                    style: TextStyle(color: Color(0xFFbdc3c7), fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      );

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



  Widget _buildSection({required String id, required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
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

            ],
          ),
          Container(
            width: 60,
            height: 3,
            color: const Color(0xFFe74c3c),
          ),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }

  Widget _buildAboutCard({required String title, required String content}) {
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

  Widget _buildPublicacionCard(Map<String, dynamic> publicacion) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(publicacion['imagen']),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    publicacion['titulo'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2c3e50),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${publicacion['fecha']} | ${publicacion['categoria']}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF7f8c8d),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    publicacion['resumen'],
                    style: const TextStyle(color: Color(0xFF333333)),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFe74c3c),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    child: const Text(
                      'Leer más',
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
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
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

  Widget _buildAsideSection({required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
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
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(Map<String, dynamic> noticia) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noticia['fecha'],
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF7f8c8d),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              noticia['titulo'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2c3e50),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              noticia['resumen'],
              style: const TextStyle(color: Color(0xFF333333)),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Leer más →',
                style: TextStyle(
                  color: Color(0xFF3498db),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterColumn(
      {required String title, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
              height: 2,
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

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFbdc3c7),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String icon) {
    return Container(
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
    );
  }
}