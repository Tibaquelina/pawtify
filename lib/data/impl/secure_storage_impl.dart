
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pawtify/data/repositories/secure_storage_repository.dart';

const _favoriteIds = 'favoriteIds';

class SecureStorageImpl extends SecureStorageRepository{

  final FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  Future<String?> readFavoriteIds()async{
    return await _storage.read(key: _favoriteIds);
  }

  @override
  Future<bool> updateFavoriteIds(String favoriteIds)async{
    try{
      await _storage.write(key: _favoriteIds, value: favoriteIds);
      return true;
    }catch(_){
      return false;
    }
  }

}