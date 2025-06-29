
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawtify/domain/models/dog_breed_model.dart';
import 'package:pawtify/ui/breeds/provider/breeds_provider.dart';
import 'package:pawtify/ui/breeds/widgets/breed_card.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final breedsProvider = context.watch<BreedsProvider>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total favorites",
                  style:GoogleFonts.junge(fontSize: 24),
                ),
                Text(breedsProvider.favoriteIds.length.toString(),
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            Divider(
              height: 1,
              thickness: 0.7,
              color: Colors.black,
            ),
            SizedBox(height: 15),
            Builder(
              builder: (context) {
                List<DogBreed> favoriteBreeds = breedsProvider.listBreeds.where(
                  (breed)=> breedsProvider.favoriteIds.contains(breed.id)
                ).toList();
                return Expanded(
                  child:ListView.builder(
                    itemCount: favoriteBreeds.length,
                    itemBuilder: (context, index){
                      final DogBreed breed = favoriteBreeds[index];
                      return BreedCard(breed: breed);
                    }
                  ),
                );
              }
            )
          ],
        ),
      )
    );
  }
}