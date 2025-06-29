
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pawtify/domain/models/dog_breed_model.dart';
import 'package:pawtify/ui/breeds/Screens/breed_details_screen.dart';
import 'package:pawtify/ui/breeds/Screens/widgets/breed_temperament_list.dart';
import 'package:pawtify/ui/breeds/Screens/widgets/dog_networ_image.dart';
import 'package:pawtify/ui/breeds/provider/breeds_provider.dart';
import 'package:pawtify/utils/navigator_utils.dart';
import 'package:provider/provider.dart';

class BreedCard extends StatefulWidget {
  const BreedCard({
    super.key,
    required this.breed
  });

  final DogBreed breed;

  @override
  State<BreedCard> createState() => _BreedCardState();
}

class _BreedCardState extends State<BreedCard> {
  String? imageUrl;
  late Future<String?> imageFuture;
  
  get temperament => null;

  @override
  void initState() {
    super.initState();
    imageFuture = loadImage();
  }

  Future<String?>loadImage() async{
    final provider = context.read<BreedsProvider>();
    final url = await provider.getImageById(widget.breed.referenceImageId);
    imageUrl= url;
    return url;
  }

  @override  
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xff979797),
      height: 1.2,
    );
    return GestureDetector(
      onTap: ()=> pushToPage(context, BreedDetailsScreen(
        breed: widget.breed,
        imageUrl: imageUrl,
      )),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom:15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0),
            )
          ]
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DogNetworkImage(
                  imageFuture: imageFuture,
                  white: 100,
                  height: 100,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    constraints:const BoxConstraints(minHeight: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 220,
                                        child: Text(widget.breed.name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            height: 1,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Icon(Icons.favorite_border),
                                    ],
                                  ),
                                  Text(widget.breed.bredFor??"",
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyle,
                                  ),
                                  
                                ],
                              ),
                            ),
                            SizedBox(width: 4),
                          ],
                        ),
                        Text("Life span: ${widget.breed.lifeSpan}", style: textStyle),
                        if(widget.breed.origin!=null && widget.breed.origin!.isNotEmpty)
                        Text("Origin: ${widget.breed.origin}",style: textStyle),
                      ],
                    ),
                  ),
                )
              ]
            ),
            SizedBox(height: 10),
            BreedTemperamentList(temperament: temperament)
          ],
        ),
      ),
    );
  }

  
}

