import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPage extends StatelessWidget {
  final String? texto;

  const CardPage({super.key, this.texto});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            texto!,
            style: GoogleFonts.croissantOne(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
