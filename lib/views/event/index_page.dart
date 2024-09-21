import 'package:flutter/material.dart';

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

  Widget _buildCard() => Container(
        width: 260,
        height: 360,
        color: Colors.grey[300],
        child: Image.network('https://placehold.co/260x360/png', fit: BoxFit.cover),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Nuestros recomendados!', style: TextStyle(fontSize: 16),),
        SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildCard(),
              const SizedBox(width: 20),
              _buildCard(),
              const SizedBox(width: 20),
              _buildCard(),
            ],
          ),
        ),
        const Text('Mira todos los eventos!', style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
