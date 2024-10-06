import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketapp/views/event/show_page.dart';

/* I need a custom data for a card about an event */
class ShowEvent {
  final String title;
  final String description;
  final String date;
  final String image;

  const ShowEvent({
    required this.title,
    required this.description,
    required this.date,
    required this.image,
  });
}

class EventIndexPage extends StatelessWidget {
  const EventIndexPage({super.key});

  Widget _testCard() => Container(
        width: 360, // Puedes ajustar el tamaño según sea necesario
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // Bordes redondeados
          image: const DecorationImage(
            image: NetworkImage(
                'https://placehold.co/360x280/png'), // Tu imagen de fondo
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Gradiente encima del fondo
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            // Fecha en la esquina superior derecha
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  children: [
                    Text(
                      "16",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "SEP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Contenido del evento
            const Positioned(
              bottom: 20,
              left: 15,
              right: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nombre del Evento",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Lun, 16 Sept",
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Córdoba, Av. Roque Saenz Peña 993",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            // Botón de favorito (estrella)
            Positioned(
              left: 10,
              top: 10,
              child: IconButton(
                icon: const Icon(
                  Icons.star_border_rounded,
                  color: Colors.pinkAccent,
                  size: 38,
                ),
                onPressed: () {
                  Get.to(() => const EventShowPage());
                },
              ),
            ),
          ],
        ),
      );

  Widget _simpleCard() => ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: NetworkImage('https://placehold.co/60x60/png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: const Text('Evento 1'),
        subtitle: const Text('Descripción del evento 1'),
        trailing: const Icon(Icons.arrow_forward_ios),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /* searchbox */
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Buscar eventos',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Text('EVENTOS DESTACADOS',
            style: TextStyle(
                fontSize: 16, fontFamily: GoogleFonts.anta().fontFamily)),
        SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _testCard(),
              const SizedBox(width: 20),
              _testCard(),
              const SizedBox(width: 20),
              _testCard(),
            ],
          ),
        ),
        Text('MÁS EVENTOS...',
            style: TextStyle(
                fontSize: 16, fontFamily: GoogleFonts.anta().fontFamily)),
        /* 60x60 show event card */
        _simpleCard(),
        _simpleCard(),
        _simpleCard(),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {},
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Ver más eventos ',
                    style: TextStyle(color: Colors.pinkAccent),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.pinkAccent,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
