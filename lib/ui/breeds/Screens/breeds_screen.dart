
import 'package:flutter/material.dart';
import 'package:pawtify/domain/models/dog_breed_model.dart';
import 'package:pawtify/ui/breeds/Screens/widgets/breed_card.dart';
import 'package:pawtify/ui/breeds/provider/breeds_provider.dart';
import 'package:provider/provider.dart';

class BreedsScreen extends StatelessWidget {
  const BreedsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final breedsProvider = context.watch<BreedsProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height: 25),
            TextField(
              decoration: InputDecoration(
                hintText: "Buscar",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15)
                ),
                filled:  true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 0)
              ),
              onChanged: breedsProvider.filterbreedsByName,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total razas",
                  style: TextStyle(fontSize: 24),
                ),
                Text(breedsProvider.listBreeds.length.toString(),
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
            Expanded(
              child:ListView.builder(
                itemCount: breedsProvider.listBreeds.length,
                itemBuilder: (context, index){
                  final DogBreed breed =breedsProvider.listBreeds[index];
                  return BreedCard(breed: breed);
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}

