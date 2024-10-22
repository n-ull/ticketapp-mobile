import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticketapp/views/widgets/gradient_text.dart';

class Logotype extends StatelessWidget {
  final double size = 48.0;

  const Logotype({
    super.key,
    required double size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GradientText(
          'moov',
          gradient:
              const LinearGradient(colors: [Colors.purpleAccent, Colors.pink]),
          style: TextStyle(
            fontSize: size,
            fontFamily: GoogleFonts.rowdies().fontFamily,
          ),
        ),
        Text(
          ' in',
          style: TextStyle(
            color: Colors.white,
            fontSize: size / 2,
            fontFamily: GoogleFonts.rowdies().fontFamily,
          ),
        )
      ],
    );
  }
}
