import 'dart:convert';

class AddMaterialResponse {
  String statusCode;
  String statusMessage;

  AddMaterialResponse({
    required this.statusCode,
    required this.statusMessage,
  });

  AddMaterialResponse copyWith({
    String? statusCode,
    String? statusMessage,
  }) =>
      AddMaterialResponse(
        statusCode: statusCode ?? this.statusCode,
        statusMessage: statusMessage ?? this.statusMessage,
      );

  factory AddMaterialResponse.fromRawJson(String str) => AddMaterialResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddMaterialResponse.fromJson(Map<String, dynamic> json) => AddMaterialResponse(
    statusCode: json["status_code"],
    statusMessage: json["status_message"],
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status_message": statusMessage,
  };
}
