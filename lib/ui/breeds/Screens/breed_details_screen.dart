
import 'package:flutter/material.dart';
import 'package:pawtify/domain/models/dog_breed_model.dart';
import 'package:pawtify/ui/breeds/Screens/widgets/breed_temperament_list.dart';
import 'package:pawtify/ui/shared/app_background.dart';
import 'package:pawtify/utils/navigator_utils.dart';

class BreedDetailsScreen extends StatelessWidget {
  const BreedDetailsScreen({
    required this.breed,
    this.imageUrl,
    super.key
    });

  final DogBreed breed;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: Color(0xff979797),
      fontSize: 20,
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: ()=> popToPage(context),
        ),
      ),
      body: AppBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 310,
                        child: Text(breed.name,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(Icons.favorite_border,size:35),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  if(breed.bredFor!=null)
                  Text (breed.bredFor!, style: textStyle),
                  SizedBox(height: 15),
                  if(imageUrl!=null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(imageUrl!)),
                  SizedBox(height: 15),
                  BreedTemperamentList(temperament: breed.temperament),
                  SizedBox(height: 15),
                  Text('Life span: ${breed.lifeSpan}', style: textStyle),
                  const SizedBox(height: 15),
                  if(breed.origin!=null)
                  Text('Origin: ${breed.origin}', style: textStyle),
                  const SizedBox(height: 15),
                  Text('Breed group: ${breed.breedGroup}', style: textStyle),
                  Text('Measuraments:', style: textStyle),
                  Text('  Imperial', style: textStyle),
                  Text('    Weight: ${breed.weight.imperial} in', style: textStyle),
                  Text('    Height: ${breed.height.imperial} in', style: textStyle),
                  Text('  Metric', style: textStyle),
                  Text('    Weight: ${breed.weight.metric} cm', style: textStyle),
                  Text('    Height: ${breed.height.metric} cm', style: textStyle),
                ]
              )
            )
          ),
        )
      )
    );
  }
}