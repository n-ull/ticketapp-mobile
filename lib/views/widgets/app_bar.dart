import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/logo.png'),
        ),
      ),
      title: const Text('moova'),
      titleTextStyle: TextStyle(
        fontFamily: GoogleFonts.rowdies().fontFamily,
        fontSize: 24,
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