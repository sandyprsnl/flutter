import 'dart:convert';

LoginResponseModal loginResponseModalFromJson(String str) =>
    LoginResponseModal.fromJson(json.decode(str));

class LoginResponseModal {
  bool? success;
  int? statusCode;
  String? code;
  String? message;
  Data? data;
  LoginResponseModal(
      {required this.success,
      required this.statusCode,
      required this.code,
      required this.message,
      required this.data});

  LoginResponseModal.fromJson(Map<String, dynamic> json) {
    print(json);
    success = json['success'];
    statusCode = json['statusCode'];
    code = json['code'];
    message = json['message'];
    data = json['data'].length > 0 ? Data.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['code'] = this.code;
    data['message'] = this.message;
    data['data'] = this.data;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  int? id;
  String? email;
  String? nicename;
  String? fristName;
  String? lastName;
  String? displayName;
  Data(
      {this.token,
      this.id,
      this.email,
      this.nicename,
      this.fristName,
      this.lastName,
      this.displayName});
  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    email = json['email'];
    nicename = json['nicename'];
    fristName = json['fristName'];
    lastName = json['lastName'];
    displayName = json['displayName'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['token'] = this.token;
    data['id'] = this.id;
    data['email'] = this.email;
    data['nicename'] = this.nicename;
    data['fristName'] = this.fristName;
    data['lastName'] = this.lastName;
    data['displayName'] = this.displayName;
    return data;
  }
}
