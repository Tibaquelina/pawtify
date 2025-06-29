
import 'package:flutter/material.dart';

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
          for(int i=0;i< temperamenList(temperament).length;i++)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6) ,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff92A988),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text(temperamenList(temperament)[i],
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff92A988)
              )
            ),
          )
        ],
      ),
    );
  }

  temperamenList(String? temperament) {
    if(temperament==null) return [];
    return temperament.split(",").map((trait)=>trait.trim()).toList();
  }
  
}