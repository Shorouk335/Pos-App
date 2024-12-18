class LoginRequestModel {
  String? email;
  String? password;
  String? device;

  LoginRequestModel({this.email, this.password, this.device});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['device'] = "mobile";
    return data;
  }
}
