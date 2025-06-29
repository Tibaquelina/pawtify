import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawtify/domain/models/dog_breed_model.dart';
import 'package:pawtify/ui/breeds/provider/breeds_provider.dart';
import 'package:pawtify/ui/breeds/screens/breed_details_screen.dart';
import 'package:pawtify/ui/breeds/widgets/breed_temperament_list.dart';
import 'package:pawtify/ui/breeds/widgets/dog_networ_image.dart';
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

  @override
  void initState() {
    super.initState();
    imageFuture = loadImage();
  }

  Future<String?> loadImage() async {
    final provider = context.read<BreedsProvider>();
    final url = await provider.getImageById(widget.breed.referenceImageId);
    imageUrl = url;
    return url;
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = GoogleFonts.notoSerif(
      color: Color(0xff979797),
      fontSize: 16,
      height: 1.2
    );
    final breedsProvider = context.watch<BreedsProvider>();
    return GestureDetector(
      onTap: () => pushToPage(context, BreedDetailsScreen(
        breed: widget.breed,
        imageUrl: imageUrl
      )),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0,0),
              blurRadius: 10,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.1)
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
                  width: 100,
                  height: 100,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 100),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 220,
                                        child: Text(widget.breed.name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.notoSerif(
                                            fontSize: 20,
                                            height: 1,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => breedsProvider.updateFavoriteId(widget.breed.id),
                                        child: Icon(breedsProvider.getFavoriteIcon(widget.breed.id))
                                      )
                                    ],
                                  ),
                                  Text(widget.breed.bredFor??'',
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyle,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text('Life span: ${widget.breed.lifeSpan}', style: textStyle),
                        if(widget.breed.origin!=null && widget.breed.origin!.isNotEmpty)
                          Text('Origin: ${widget.breed.origin}', style: textStyle),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            BreedTemperamentList(temperament: widget.breed.temperament)
          ],
        ),
      ),
    );
  }
}
