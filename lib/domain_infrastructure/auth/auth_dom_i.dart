

import 'package:apexdmit_noor_alam_abir/data/remote/api_methods.dart';
import 'package:apexdmit_noor_alam_abir/data/remote/api_urls.dart';
import 'package:apexdmit_noor_alam_abir/data/remote/responses/auth_response.dart';
import 'package:apexdmit_noor_alam_abir/domain_infrastructure/core/dependecy_container.dart';
import 'package:flutter/cupertino.dart';

class Auth_Dom_I {

  final apiService = sl<ApiService>();

  Future<AuthResponse> loginUser(String email, String password, BuildContext context) async{
    final requestBody = {
      "email": email,
      "password": password
    };
    var response = await apiService.post(APIUrls.auth, context, body: requestBody);
    return AuthResponse.fromJson(response);
  }

}
