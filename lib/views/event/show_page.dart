import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventShowPage extends StatefulWidget {
  const EventShowPage({super.key});

  @override
  State<EventShowPage> createState() => _EventShowPageState();
}

class _EventShowPageState extends State<EventShowPage> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-31.4014496, -64.1754541);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: BackButton(
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          /* image */
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage('https://placehold.co/600x300/png'),
                    fit: BoxFit.cover)),
            width: double.infinity,
            height: 300,
            child: const Center(
              child: Text('Nombre del evento',
                  style: TextStyle(fontSize: 24, color: Colors.black)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.white),
                        SizedBox(width: 10),
                        Text('24/10/2024', style: TextStyle(fontSize: 16))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.schedule_rounded, color: Colors.white),
                        SizedBox(width: 10),
                        Text('21:00 a 03:30', style: TextStyle(fontSize: 16))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on_rounded, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Av. Córdoba 2999', style: TextStyle(fontSize: 16))
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                        'lorem ipsum dolor sit amet consectetur adipiscing elit',
                        style: TextStyle(fontSize: 16)),
                  ],
                )),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition:
                      CameraPosition(target: _center, zoom: 20.0),
                ),
              )),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
                child: Text('COMPRAR ENTRADAS',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: GoogleFonts.rowdies().fontFamily))),
          )
        ],
      ),
    );
  }
}
