import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketapp/controllers/shows.dart';
import 'package:ticketapp/models/show_model.dart';

class EventShowPage extends StatefulWidget {
  const EventShowPage({super.key});

  @override
  State<EventShowPage> createState() => _EventShowPageState();
}

class _EventShowPageState extends State<EventShowPage> {
  final _showController = Get.put(ShowController());

  @override
  Widget build(BuildContext context) {
    final showId = Get.arguments as int;

    _showController.fetchShow(showId);

    return Scaffold(
      body: Obx(() {
        if (_showController.isLoadingAllShows.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          ShowModel? show = _showController.showDetail.value;
          return Column(
            children: [
              Text(show!.title, style: GoogleFonts.poppins(fontSize: 24)),
              Text(show.organizer),
              Text(show.description),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const MakeOrderPage());
                },
                child: const Text('Order Ticket'),
              ),
            ],
          );
        }
      }),
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
