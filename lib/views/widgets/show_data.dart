import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/models/show_model.dart';
import 'package:ticketapp/views/event/show_page.dart';

class ShowData extends StatelessWidget {
  const ShowData({super.key, required this.show});

  final ShowModel show;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => EventShowPage(show: show));
      },
      leading: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: NetworkImage('https://placehold.co/64x64/png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(show.title, overflow: TextOverflow.ellipsis, maxLines: 1),
      subtitle: Text(show.organizer),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
