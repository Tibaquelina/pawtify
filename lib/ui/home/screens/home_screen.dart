
import 'package:flutter/material.dart';
import 'package:pawtify/main.dart';
import 'package:pawtify/ui/breeds/Screens/breeds_screen.dart';
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
            Center(
              child: Text("Favoritos"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeProvider.currentIndex,
        onTap: homeProvider.setCurrentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Transform.rotate(
              angle: 270 * pi /180,
              child: Image.asset("assets/paw.png",height: 30)
            ),
            label: "Razas"
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/h.png",height: 30),
            label: "Favorites"
          ),
        ],
      ),
    );
  }
}