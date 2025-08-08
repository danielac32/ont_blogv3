import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SectionVisionMission extends StatelessWidget {
  final List<Map<String, String>> cardsData = [
    {
      'title': ' ',
      //'content': "Contribuir al incremento de la eficiencia en la gestión de la Oficina Nacional del Tesoro, a través del acondicionamiento sistematizado e integral de su estructura organizativa, funciones, procesos y mecanismos de coordinación, a fin de maximizar el desarrollo de los planes y objetivos definidos, como rectora del Sistema de Tesorería."
      'url':'assets/quienes2/MI1.png'//obje.png'
    },
    {
      'title': ' ',
      'url':'assets/quienes2/VI1.png'//valores.png'//'content': ' Compromiso , Ética , Responsabilidad , Integridad , Lealtad , Equidad , Innovación , Respeto'
    },
    {
      'title': ' ',
      'url':'assets/quienes2/OBJGE1.png'//valores.png'//'content': ' Compromiso , Ética , Responsabilidad , Integridad , Lealtad , Equidad , Innovación , Respeto'
    },

    {
      'title': ' ',
      //'content': "Como órgano rector técnico del Sistema de Tesorería, la función y gestión de la Oficina Nacional del Tesoro, se proyecta a los avances tecnológicos y la vocación de servicio público de su talento humano, a fin de lograr con eficacia y eficiencia, la administración de los recursos financieros que permitan cumplir oportunamente con los compromisos adquiridos por la República y las entidades político territoriales."
      'url':'assets/quienes2/ESPE1.png' //misi.png'
    },
    {
      'title': ' ',
      //'content': "Ejercer rectoría técnica del Sistema de Tesorería, de acuerdo a los preceptos jurídicos y políticas macroeconómicas definidas por el gobierno nacional, para cumplir con los compromisos adquiridos por los órganos y entes de la República, y de las entidades político territoriales, de manera oportuna, transparente, eficaz y eficiente."
      'url':'assets/quienes2/ESPE2.png' //visi.png'
    },
    {
      'title': ' ',
      //'content': "Ejercer rectoría técnica del Sistema de Tesorería, de acuerdo a los preceptos jurídicos y políticas macroeconómicas definidas por el gobierno nacional, para cumplir con los compromisos adquiridos por los órganos y entes de la República, y de las entidades político territoriales, de manera oportuna, transparente, eficaz y eficiente."
      'url':'assets/quienes2/ESPE3.png' //visi.png'
    },
   
  ];

   SectionVisionMission({super.key});

  @override
  Widget build(BuildContext context) {
    final double itemWidth = MediaQuery.of(context).size.width * 0.4;
    final double viewportFraction = itemWidth / MediaQuery.of(context).size.width;

    return Stack(
      children: [
        // Fondo opcional (puedes quitarlo si no lo necesitas)
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Ajusta este valor para cambiar el radio de los bordes
            child: Image.asset(
              'assets/banner_inf.jpg',
              fit: BoxFit.fill,
              //color: Colors.black.withOpacity(0.01),
              colorBlendMode: BlendMode.darken,
            ),
          ),
        ),

        // Contenedor principal del carrusel
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 300, // Altura ajustada para contenido textual
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: viewportFraction,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: true,
              initialPage: (cardsData.length ~/ 2),
              autoPlayInterval: const Duration(seconds: 5),
            ),
            items: cardsData.map((card) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    //width: itemWidth,
                    //height: itemWidth,

                    child: Image.asset(
                      card['url'] ?? '',
                      fit: BoxFit.contain, // Cambiado de 'cover' a 'contain'
                    ),
                    /*Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            card['title']!,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                card['content']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                    fontStyle: FontStyle.italic
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),*/
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}