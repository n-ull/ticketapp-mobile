import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketapp/views/widgets/gradient_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
  }
}
