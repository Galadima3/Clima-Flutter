import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  final String? apiEndPoint;
  NetworkHelper({this.apiEndPoint});

  Future getData() async {
    String apiEndpoint = apiEndPoint!;
        
    final Uri url = Uri.parse(apiEndpoint);
    Response response = await get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
       
    } else {
      print(response.statusCode);
    }
  }
}
