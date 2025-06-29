
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pawtify/domain/models/dog_breed_model.dart';
import 'package:pawtify/domain/usecaese/app_use_case.dart';

class BreedsProvider extends ChangeNotifier {
  final AppUseCase appUseCase;

  BreedsProvider(this.appUseCase);

  List<DogBreed> _breeds =[];
  List<DogBreed> _filterbreeds = [];
  List<DogBreed> listBreeds = [];
  bool isSearchEmpety = false;


  Future<void> getAllBreeds()async{
    List<DogBreed>? newBreeds = await appUseCase.getAllBreeds();
    if(newBreeds != null){
      _breeds = newBreeds;
      notifyListeners();
       updateLiistBreds();
      log("Breeds: ${listBreeds.length}");
    }
  }

  Future<String?> getImageById(String id)async{
    return await appUseCase.getBreedById(id);
  }

  void filterbreedsByName(String query){
    if(query.isNotEmpty){
      final lowerQuery = query.toLowerCase();
      _filterbreeds = _breeds.where((breed)=> breed.name.toLowerCase().contains(lowerQuery)).toList();
      isSearchEmpety=_filterbreeds.isEmpty;
    }else{
      _filterbreeds = [];
      isSearchEmpety = true;
    }
    notifyListeners(); 
    updateLiistBreds();
  }
  void updateLiistBreds(){
    listBreeds = _filterbreeds.isEmpty
      ?isSearchEmpety
        ?_filterbreeds
        :_breeds
      :_filterbreeds;
    notifyListeners();
  }
}