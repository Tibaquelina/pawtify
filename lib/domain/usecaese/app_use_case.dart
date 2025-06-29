
import 'dart:convert';

import 'package:pawtify/data/repositories/app_repository.dart';
import 'package:pawtify/data/repositories/secure_storage_repository.dart';
import 'package:pawtify/domain/models/dog_breed_model.dart';

class AppUseCase {
  final AppRepository _appRepository;
  final SecureStorageRepository _secureStorageRepository;

  AppUseCase(
    this._appRepository,
    this._secureStorageRepository
  );

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
    var response = await _appRepository.getBreedById(id);
    if (response.statusCode ==200){
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      return jsonMap["url"] as String?;
    }
    return null;
  }

  Future<List<int>> updateFavoriteId(int id, {required bool add}) async {
    String? favoriteIdsStr = await _secureStorageRepository.readFavoriteIds();
    List<int> currentList = favoriteIdsStr != null
      ? _decodeIntList(favoriteIdsStr)
      : [];

    if (add) {
      if (!currentList.contains(id)) {
        currentList.add(id);
      }
    } else {
      currentList.remove(id);
    }

    String updatedStr = _encodeIntList(currentList);
    await _secureStorageRepository.updateFavoriteIds(updatedStr);

    return currentList;
  }


  //Pasa de List<int> a un String
  String _encodeIntList(List<int> list) => jsonEncode(list);

  //Pasa de String a List<int>
  List<int> _decodeIntList(String jsonString){
    final decoded =jsonDecode(jsonString);
    return List<int>.from(decoded);
  }

}

