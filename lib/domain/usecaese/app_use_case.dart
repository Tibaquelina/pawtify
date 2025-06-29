
import 'dart:convert';
import 'dart:developer';

import 'package:pawtify/data/repositories/app_repository.dart';
import 'package:pawtify/domain/models/dog_breed_model.dart';

class AppUseCase {
  final AppRepository _appRepository;

  AppUseCase(this._appRepository);

  Future<List<DogBreed>?> getAllBreeds ()async{
    var response =await _appRepository.getAllBreeds();
    if(response.statusCode ==200){
      final List<dynamic> jsonList = json.decode(response.body);
      List<DogBreed> breeds = jsonList.map((json) => DogBreed.fromJson(json)).toList();
      return breeds;
    }
    return null;
  }
  Future<String?> getBreedById(String id)async{
    log("1");
    var response = await _appRepository.getBreedById(id);
    log("2: ${response.statusCode}");
    if (response.statusCode ==200){
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      return jsonMap["url"] as String?;
    }
    return null;
  }

}

