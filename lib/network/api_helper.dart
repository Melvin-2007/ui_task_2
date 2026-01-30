import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiHelper {
  static callApi({required String url}) async {
    Map<String, dynamic> data = {"success": false, "error": null};
    try {
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        data["success"] = true;
        data.addAll(jsonDecode(response.body));
      }
      else if (response.statusCode == 500) {
        data["error"] = "Internal server error";
      }
      else if (response.statusCode == 404) {
        data["error"] = "URL not found";
      }
      else {
        data["error"] = "Something went wrong";
      }
      
    } on SocketException {
      data["error"] = "No internet connection";
    } catch (e) {
      data["error"] = "Something went wrong";
    }
    return data;
  }
}
