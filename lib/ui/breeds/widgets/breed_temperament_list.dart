
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BreedTemperamentList extends StatelessWidget {
  const BreedTemperamentList({
    super.key,
    this.temperament
  });

  final String? temperament;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for(int i=0;i<temperamentList(temperament).length;i++)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff92A988),
                width: 1.5
              ),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text(temperamentList(temperament)[i],
              style: GoogleFonts.notoSerif(
                fontSize: 17,
                color: Color(0xff92A988)
              ),
            ),
          )
        ],
      ),
    );
  }
  
  temperamentList(String? temperament){
    if(temperament==null) return [];
    return temperament.split(',').map((trait)=>trait.trim()).toList();
  }

}