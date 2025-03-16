

import 'package:apexdmit_noor_alam_abir/data/remote/api_methods.dart';
import 'package:apexdmit_noor_alam_abir/data/remote/api_urls.dart';
import 'package:apexdmit_noor_alam_abir/data/remote/responses/auth_response.dart';
import 'package:apexdmit_noor_alam_abir/data/remote/responses/get_material_response.dart';
import 'package:apexdmit_noor_alam_abir/domain_infrastructure/core/dependecy_container.dart';
import 'package:flutter/cupertino.dart';

class Home_Dom_I {

  final apiService = sl<ApiService>();

  Future<GetMaterialResponse> getProducts(String token, BuildContext context) async{
    final headers = {
      "Authorization": "bearer $token",
    };
    var response = await apiService.get(APIUrls.product, context, headers: headers);
    return GetMaterialResponse.fromJson(response);
  }

}
