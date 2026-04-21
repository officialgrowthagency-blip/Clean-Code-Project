
import 'package:http/http.dart' as http;

class ApiService {

  Future<http.Response> getCrudApiData (String endPoint) async {

   final String baseUrl = "https://fakestoreapi.com/";

    final uri = Uri.parse("$baseUrl/$endPoint");

    try {

      final response = await http.get(uri);

       return response;

    } catch (e) {
       throw Exception(e.toString());
    }
  }
}