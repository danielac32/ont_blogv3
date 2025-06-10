import 'package:flutter/material.dart';
import 'package:ont_blog_v3/view/carrusel.dart';

import 'package:ont_blog_v3/view/widget/aside.dart';

import 'package:ont_blog_v3/view/widget/footer.dart';
import 'package:ont_blog_v3/view/widget/gestion_carrusel.dart';
import 'package:ont_blog_v3/view/widget/section_gestion.dart';
import 'package:ont_blog_v3/view/widget/section_mission_vision.dart';
import 'package:ont_blog_v3/view/widget/section_publications.dart';

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

  final ScrollController _scrollController = ScrollController();
  bool _showNavBar = false;
  final GlobalKey somosOntKey = GlobalKey();
  final GlobalKey publicacionesKey = GlobalKey();
  final GlobalKey MissionKey = GlobalKey();
  final GlobalKey gestionKey = GlobalKey();
  final GlobalKey graphKey = GlobalKey();
  final GlobalKey contactanosKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }


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
    _scrollController.addListener(() {
      if (_scrollController.offset > 100) {
        setState(() => _showNavBar = true);
      } else {
        setState(() => _showNavBar = false);
      }
    });
    // Auto-rotate carousels
    //_startCarouselTimer();
    //_startGestionTimer();
  }
/*
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
*/
  @override
  void dispose() {
    _carouselController.dispose();
    _gestionController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.withOpacity(0.2),
      body: Stack(
        children: [
          CustomScrollView(
              controller: _scrollController,
              slivers: [
                WidgetHeader(showNavBar: _showNavBar),
                SliverToBoxAdapter(
                    child: CarouselWidget(
                      carouselController: _carouselController,
                      carouselItems: _carouselItems,
                      currentCarouselIndex: 0,//_currentCarouselIndex,
                      height: 500, // Opcional, por defecto es 500
                    ),
                ),
                SliverToBoxAdapter(
                  child: const SizedBox(height: 24),
                ),
                SliverToBoxAdapter(
                    child:Padding(
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
                                SectionVisionMission(key: MissionKey),
                                // Sección Publicaciones
                                SectionPublications(publicaciones: _publicaciones,key: publicacionesKey,),
                                // Sección Gestión
                                SectionGestion(key: gestionKey,),
                              ],
                            ),
                          ),
                          // Aside
                          const SizedBox(width: 20),
                          AsideWidget(noticias: _noticias),
                        ],
                      ),
                    )
                ),
                SliverToBoxAdapter(
                  child:  GestionCarousel( items: _gestionItems),
                ),
                SliverToBoxAdapter(
                  child: CustomFooter(),
                )
              ]
          ),
          //aqui el nav
          NavBar(
            showNavBar: _showNavBar,
            onSomosOntTap: () => scrollToSection(somosOntKey),
            onPublicacionesTap: () => scrollToSection(publicacionesKey),
            onGestionTap: () => scrollToSection(gestionKey),
            onContactanosTap: () => scrollToSection(contactanosKey),
          ),
        ],
      ),
    );
  }
}



class NavBar extends StatelessWidget {
  final bool showNavBar;
  final VoidCallback onSomosOntTap;
  final VoidCallback onPublicacionesTap;
  final VoidCallback onGestionTap;
  final VoidCallback onContactanosTap;

  const NavBar({
    super.key,
    required this.showNavBar,
    required this.onSomosOntTap,
    required this.onPublicacionesTap,
    required this.onGestionTap,
    required this.onContactanosTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: showNavBar ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: 70,
        color: Colors.white.withOpacity(0.5),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            Image.asset(
              'assets/logo.png',
              height: 50,
              fit: BoxFit.cover,
            ),

            // Menú
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: onSomosOntTap,
                  child: Text(
                    'Somos ONT',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                GestureDetector(
                  onTap: onPublicacionesTap,
                  child: Text(
                    'Publicaciones',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                GestureDetector(
                  onTap: onGestionTap,
                  child: Text(
                    'Gestión',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                GestureDetector(
                  onTap: onContactanosTap,
                  child: Text(
                    'Contáctanos',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




class WidgetHeader extends StatelessWidget {
  const WidgetHeader({
    super.key,
    required bool showNavBar,
  }) : _showNavBar = showNavBar;

  final bool _showNavBar;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AnimatedOpacity(
        opacity: _showNavBar ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Cintillo.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

