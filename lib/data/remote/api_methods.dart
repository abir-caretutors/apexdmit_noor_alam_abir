import 'package:apexdmit_noor_alam_abir/presentation/auth_feature/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

class ApiService {

  final container = ProviderContainer();
  /// Generic GET method
  Future<dynamic> get(String url, BuildContext context, {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse('$url'),
      headers: headers,
    );
    return _handleResponse(response, context);
  }

  /// Generic POST method
  Future<dynamic> post(String url, BuildContext context, {Map<String, String>? headers, dynamic body}) async {
    container.read(loadingProvider.notifier).state = true;
    print(headers);
    print(jsonEncode(body));
    final response = await http.post(
      Uri.parse('$url'),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    container.read(loadingProvider.notifier).state = false;
    return _handleResponse(response, context);
  }

  /// Generic PUT method
  Future<dynamic> put(String url, BuildContext context, {Map<String, String>? headers, dynamic body}) async {
    final response = await http.put(
      Uri.parse('$url'),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    _handleResponse(response, context);
    return response;
  }

  /// Generic DELETE method
  Future<dynamic> delete(String url, BuildContext context, {Map<String, String>? headers}) async {
    final response = await http.delete(
      Uri.parse('$url'),
      headers: headers,
    );
    return _handleResponse(response, context);
  }

  /// Handles API responses
  dynamic _handleResponse(http.Response response, BuildContext context) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        {
          Map<String, dynamic> jsonData = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${jsonData['status_message']}"),
            ),
          );
          throw Exception('Bad Request: ${response.body}');
        }
      case 401:
        {
          Map<String, dynamic> jsonData = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${jsonData['status_message']}"),
            ),
          );
          throw Exception('Unauthorized: ${response.body}');
        }
      case 403:
        {
          Map<String, dynamic> jsonData = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${jsonData['status_message']}"),
            ),
          );
          throw Exception('Forbidden: ${response.body}');
        }
      case 404:
        {
          Map<String, dynamic> jsonData = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${jsonData['status_message']}"),
            ),
          );
          throw Exception('Not Found: ${response.body}');
        }
      case 500:
        {
          Map<String, dynamic> jsonData = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${jsonData['status_message']}"),
            ),
          );
          throw Exception('Internal Server Error: ${response.body}');
        }
      default:
        {
          Map<String, dynamic> jsonData = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${jsonData['status_message']}"),
            ),
          );
          throw Exception('Unexpected Error: ${response.body}');
        }
    }
  }
}
