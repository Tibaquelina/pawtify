
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawtify/ui/breeds/Screens/breeds_screen.dart';
import 'package:pawtify/ui/breeds/Screens/favorites_screen.dart';
import 'package:pawtify/ui/home/provider/home_provider.dart';
import 'package:pawtify/ui/shared/app_background.dart';
import 'package:pawtify/ui/shared/app_logo.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final homeProvider = context.watch<HomeProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: AppLogo(),
          )),
      ),
      body:AppBackground(
        child: PageView(
          controller: homeProvider.controller,
          children: [
            BreedsScreen(),
            FavoritesScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeProvider.currentIndex,
        onTap: homeProvider.setCurrentIndex,
        selectedLabelStyle: GoogleFonts.junge(
          fontSize: 16,
          color: homeProvider.getItemColor(homeProvider.currentIndex),
        ),
        unselectedLabelStyle: GoogleFonts.junge(
          fontSize: 16,
          color: homeProvider.getItemColor(homeProvider.currentIndex==1?0:1),
        ),
        items: [
          BottomNavigationBarItem(
            icon: Transform.rotate(
              angle: 270 * pi /180,
              child: Image.asset("assets/paw.png",
                height: 30,
                color: homeProvider.getItemColor(0),
              )
            ),
            label: "Breeds"
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/h.png",
              height: 30,
              color: homeProvider.getItemColor(1),
            ),
            label: "Favorites"
          ),
        ],
      ),
    );
  }
}