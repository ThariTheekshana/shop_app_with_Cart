import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_with_cart/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // logo
        Padding(
          padding: const EdgeInsets.only(
              left: 80.0, right: 80.0, top: 160.0, bottom: 40.0),
          child: Image.asset('lib/images/avocado.png'),
        ),
        // we deliver groceries at doorstep
        Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            "We deliver groceries at your doorstep.",
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSerif(
                fontSize: 36.0, fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(height: 24.0),

        // fresh items everyday
        Text(
          "Fresh items everyday",
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),

        const Spacer(),
        // get started button
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) {
                return const HomePage();
              }),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(25),
            child: const Text(
              "Get Started",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        const Spacer(),
      ],
    ));
  }
}
