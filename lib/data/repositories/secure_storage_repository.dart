abstract class SecureStorageRepository {
  Future<String?> readFavoriteIds();
  Future<bool> updateFavoriteIds(String favoriteIds);
}
