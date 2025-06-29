import 'package:pawtify/data/repositories/app_repository.dart';
import 'package:http/http.dart' as http;
import 'package:pawtify/utils/backend_settings.dart';

class AppImpl extends AppRepository {
  @override 
  Future<http.Response> getAllBreeds()async{
    final url = Uri.parse(getAllBreadUrl);
    final headers = {'Content-Type': 'application/json',};
    return await http.get(url, headers:  headers);
  }

  @override 
  Future<http.Response> getBreedById(String id)async{
    final url = Uri.parse(getBreedByIdUrl+id);
    //final headers = {"":""};
    return await http.get(url);
  }
}