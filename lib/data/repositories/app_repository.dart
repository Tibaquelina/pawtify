
import 'package:http/http.dart';

abstract class AppRepository {
  Future<Response> getAllBreeds();
  Future<Response> getBreedById(String id);
}