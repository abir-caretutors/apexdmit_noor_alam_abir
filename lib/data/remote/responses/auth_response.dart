import 'dart:convert';

class AuthResponse {
  String statusCode;
  String statusMessage;
  String accessToken;
  String tokenType;
  int expiresIn;
  UserData userData;

  AuthResponse({
    required this.statusCode,
    required this.statusMessage,
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.userData,
  });

  AuthResponse copyWith({
    String? statusCode,
    String? statusMessage,
    String? accessToken,
    String? tokenType,
    int? expiresIn,
    UserData? userData,
  }) =>
      AuthResponse(
        statusCode: statusCode ?? this.statusCode,
        statusMessage: statusMessage ?? this.statusMessage,
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
        userData: userData ?? this.userData,
      );

  factory AuthResponse.fromRawJson(String str) => AuthResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    statusCode: json["status_code"],
    statusMessage: json["status_message"],
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    userData: UserData.fromJson(json["user_data"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status_message": statusMessage,
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
    "user_data": userData.toJson(),
  };
}

class UserData {
  int id;
  String email;
  String firstName;
  String lastName;
  int roleId;

  UserData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.roleId,
  });

  UserData copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    int? roleId,
  }) =>
      UserData(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        roleId: roleId ?? this.roleId,
      );

  factory UserData.fromRawJson(String str) => UserData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    roleId: json["role_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "role_id": roleId,
  };
}
