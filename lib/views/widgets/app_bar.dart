import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketapp/views/user/index_ticket_page.dart';
import 'package:ticketapp/views/widgets/gradient_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace:
          Container(decoration: const BoxDecoration(color: Colors.black)),
      elevation: 0,
      title: const Row(
        children: [
          GradientText('moov',
              gradient:
                  LinearGradient(colors: [Colors.purpleAccent, Colors.pink])),
          Text(
            ' in',
            style: TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
      titleTextStyle: TextStyle(
        fontFamily: GoogleFonts.rowdies().fontFamily,
        fontSize: 28,
        color: Colors.purpleAccent,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.confirmation_num_rounded),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserIndexTicketPage()));
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
  }
}
