
import 'package:flutter/material.dart';

class DogNetworkImage extends StatelessWidget {
  const DogNetworkImage({
    super.key,
    required this.imageFuture,
    required this.width,
    required this.height,
  });

  final Future<String?> imageFuture;
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5)
      ),
      child: FutureBuilder<String?>(
        future: imageFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );  
          }else if (snapshot.hasError || !snapshot.hasData || snapshot.data ==null){
            return Center(
              child: Icon(Icons.broken_image, color: Colors.black),
            );
          }else  {
            return ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(snapshot.data!,
                fit: BoxFit.cover,
              ),
            );
          }
        },
      ),
    );
  }
}