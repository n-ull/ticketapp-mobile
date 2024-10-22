import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserIndexTicketPage extends StatefulWidget {
  const UserIndexTicketPage({super.key});

  @override
  State<UserIndexTicketPage> createState() => UserIndexTicketPageState();
}

class UserIndexTicketPageState extends State<UserIndexTicketPage> {
  final tickets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purpleAccent, Colors.pinkAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          'Mis Tickets',
          style: TextStyle(fontFamily: GoogleFonts.rowdies().fontFamily),
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: tickets != []
          ? Container(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TicketCard(
                      nombre: 'Nombre del Evento',
                      qrImageUrl: 'test',
                    ),
                  );
                },
              ),
            )
          : const Center(
              child: Text("No tienes ningún ticket activo",
                  style: TextStyle(fontSize: 20)),
            ),
    );
  }
}

class TicketCard extends StatelessWidget {
  final String nombre; // Nombre del show o evento
  final String
      qrImageUrl; // URL de la imagen del QR (puede ser local o de una API)

  const TicketCard({super.key, required this.nombre, required this.qrImageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomTicket(),
      child: Container(
        color: Colors.white, // <-- background color
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Nombre del show
            Text(
              nombre,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Imagen del QR
            Image.network(
              // qr api
              'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=1234',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTicket extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    //Radius
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(8),
      ),
    );

    // Left Round In
    path.addOval(
      Rect.fromCircle(
        center: Offset(0, (size.height / 3) * 1.65), // Position Roun In Left
        radius: 26, // Size
      ),
    );

    // Right Round In
    path.addOval(
      Rect.fromCircle(
        center: Offset(
            size.width, (size.height / 3) * 1.65), // Position Roun In Right
        radius: 26, // Size
      ),
    );

    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
