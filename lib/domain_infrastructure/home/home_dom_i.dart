

import 'package:apexdmit_noor_alam_abir/data/remote/api_methods.dart';
import 'package:apexdmit_noor_alam_abir/data/remote/api_urls.dart';
import 'package:apexdmit_noor_alam_abir/data/remote/responses/add_material_response.dart';
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

  Future<AddMaterialResponse> addProducts(String token, BuildContext context, dynamic body) async{
    final headers = {
      "Accept": "*/*",
      "Content-Type": "application/json",
      "Authorization": "bearer $token",
    };
    print(body);
    var response = await apiService.post(APIUrls.addProduct, context, headers: headers, body: body);
    return AddMaterialResponse.fromJson(response);
  }

}
