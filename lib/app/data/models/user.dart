class UserModel {
  String? userId;
  String? token;
  String? fullName;
  String? userName;
  String? email;
  String? imageUrl;
  // String? phoneNumber;
  // String? pass;
  int? tokenExpiryInMinute;
  String? refreshToken;
  String? refreshTokenExpiryTime;
  bool? isActive;
  bool? phoneNumberConfirmed;

  UserModel(
      {
      // this.phoneNumber,
      // this.pass,
      this.userId,
      this.token,
      this.email,
      this.imageUrl,
      this.userName,
      this.fullName,
      this.tokenExpiryInMinute,
      this.refreshToken,
      this.refreshTokenExpiryTime,
      this.isActive,
      this.phoneNumberConfirmed});

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    userName = json['userName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    userId = json['userId'];
    token = json['token'];
    tokenExpiryInMinute = json['tokenExpiryInMinute'];
    refreshToken = json['refreshToken'];
    refreshTokenExpiryTime = json['refreshTokenExpiryTime'];
    isActive = json['isActive'];
    phoneNumberConfirmed = json['phoneNumberConfirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['fullName'] = fullName;
    data['token'] = token;
    data['imageUrl'] = imageUrl;
    data['tokenExpiryInMinute'] = tokenExpiryInMinute;
    data['refreshToken'] = refreshToken;
    data['refreshTokenExpiryTime'] = refreshTokenExpiryTime;
    data['isActive'] = isActive;
    data['phoneNumberConfirmed'] = phoneNumberConfirmed;
    return data;
  }

  Map<String, dynamic> toLoginApi(
          {required String phone, required String pass}) =>
      {
        'phoneNumber': phone,
        'password': pass,
      };
}