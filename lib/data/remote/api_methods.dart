import "package:http/http.dart" as http;

import 'dart:convert';

class ApiService {


  /// Generic GET method
  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse('$url'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  /// Generic POST method
  Future<dynamic> post(String url, {Map<String, String>? headers, dynamic body}) async {
    final response = await http.post(
      Uri.parse('$url'),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  /// Generic PUT method
  Future<dynamic> put(String url, {Map<String, String>? headers, dynamic body}) async {
    final response = await http.put(
      Uri.parse('$url'),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  /// Generic DELETE method
  Future<dynamic> delete(String url, {Map<String, String>? headers}) async {
    final response = await http.delete(
      Uri.parse('$url'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  /// Handles API responses
  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw Exception('Bad Request: ${response.body}');
      case 401:
        throw Exception('Unauthorized: ${response.body}');
      case 403:
        throw Exception('Forbidden: ${response.body}');
      case 404:
        throw Exception('Not Found: ${response.body}');
      case 500:
        throw Exception('Internal Server Error: ${response.body}');
      default:
        throw Exception('Unexpected Error: ${response.statusCode}');
    }
  }
}
