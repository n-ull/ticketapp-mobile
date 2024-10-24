import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketapp/controllers/shows.dart';
import 'package:ticketapp/views/widgets/pinned_show_card_data.dart';
import 'package:ticketapp/views/widgets/search_bar.dart';
import 'package:ticketapp/views/widgets/show_data.dart';

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

class EventIndexPage extends StatefulWidget {
  const EventIndexPage({super.key});

  @override
  State<EventIndexPage> createState() => _EventIndexPageState();
}

class _EventIndexPageState extends State<EventIndexPage> {
  final ShowController _showController = Get.put(ShowController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _showController.isLoadingAllShows.value
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                /* ElevatedButton(
                    onPressed: () {
                      _showController.fetchShows();
                    },
                    child: const Text('Fetch Shows')), */
                /* searchbox */
                const CustomSearchBar(),
                Expanded(
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: PinnedShowCard(
                            show: _showController.shows.value[index]),
                      );
                    },
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('EVENTOS DESTACADOS',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.rowdies().fontFamily)),
                ),
                Expanded(
                  child: ListView.builder(
                      primary: false,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return ShowData(
                            show: _showController.shows.value[index]);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
    });
  }
}




/* 
Column(
      children: [
        /* searchbox */
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
    ); */
