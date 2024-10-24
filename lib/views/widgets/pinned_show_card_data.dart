import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/models/show_model.dart';
import 'package:ticketapp/views/event/show_page.dart';
import 'package:intl/intl.dart';

class PinnedShowCard extends StatelessWidget {
  const PinnedShowCard({
    super.key,
    required this.show,
  });

  final ShowModel show;

  @override
  Widget build(BuildContext context) {
    final String? showDate = show.startDate;
    DateTime parsedDate = DateTime.parse(showDate!);

    String day = DateFormat.d().format(parsedDate).toString(); // Día
    String month =
        DateFormat.MMM().format(parsedDate).toString().toUpperCase(); // Mes
    String year = DateFormat.y().format(parsedDate).toString(); // Año

    return GestureDetector(
      onTap: () {
        Get.to(() => const EventShowPage());
      },
      child: Container(
        width: 360, // Puedes ajustar el tamaño según sea necesario
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // Bordes redondeados
          image: DecorationImage(
            image: NetworkImage(show.thumbnail), // Tu imagen de fondo
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
                child: Column(
                  children: [
                    Text(
                      day,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      month,
                      style: const TextStyle(
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
            Positioned(
              bottom: 20,
              left: 15,
              right: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    show.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    "$day ${DateFormat.MMMM().format(parsedDate).toString()} $year",
                    style: const TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 14,
                    ),
                  ),
                  const Text(
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
