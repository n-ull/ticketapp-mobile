import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketapp/models/show_model.dart';

class EventShowPage extends StatefulWidget {
  const EventShowPage({super.key, this.show});

  final ShowModel? show;

  @override
  State<EventShowPage> createState() => _EventShowPageState();
}

class _EventShowPageState extends State<EventShowPage> {
  final ShowModel show = ShowModel(
      id: 1,
      title: 'Nombre del evento',
      description: 'lorem ipsum dolor sit amet consectetur adipiscing elit',
      thumbnail: 'https://placehold.co/600x300/png',
      organizer: 'Test');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
          Stack(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(show.thumbnail), fit: BoxFit.cover)),
              width: double.infinity,
              height: 300,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              width: double.infinity,
              height: 310,
              child: Center(
                child: Text(show.title,
                    style: const TextStyle(fontSize: 24, color: Colors.white)),
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 20, 20, 20),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.white),
                        SizedBox(width: 10),
                        Text('24/10/2024', style: TextStyle(fontSize: 16))
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(Icons.schedule_rounded, color: Colors.white),
                        SizedBox(width: 10),
                        Text('21:00 a 03:30', style: TextStyle(fontSize: 16))
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(Icons.location_on_rounded, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Av. Córdoba 2999', style: TextStyle(fontSize: 16))
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(show.description,
                        style: const TextStyle(fontSize: 16)),
                  ],
                )),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const MakeOrderPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
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

class MakeOrderPage extends StatefulWidget {
  const MakeOrderPage({super.key});

  @override
  State<MakeOrderPage> createState() => _MakeOrderPageState();
}

class _MakeOrderPageState extends State<MakeOrderPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
