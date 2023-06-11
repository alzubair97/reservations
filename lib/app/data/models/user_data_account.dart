class UserDataAccount {
  late int id;
  late String apiId;
  String? name;
  String? mobile;
  late String idCardNumber;
  int? cityId;
  String? adderss;
  String? img;
  String? loginName;
  String? password;
  String? userTypeAsString;
  late bool active;
  late bool approved;
  DateTime? registerDate;
  late bool async;

  UserDataAccount({
    this.id = 0,
    this.apiId = '',
    this.name,
    this.mobile,
    this.idCardNumber = '',
    this.cityId,
    this.adderss,
    this.img,
    this.loginName,
    this.password,
    this.userTypeAsString,
    this.registerDate,
    this.active = false,
    this.approved = false,
    this.async = true,
  });

  UserDataAccount.fromJson(
      {required Map<String, dynamic> json, String? userName, String? pass}) {
    loginName = userName ?? json['username'];
    id = json['id'];
    apiId = json['apiId'];
    name = json['name'];
    mobile = json['mobile'];
    idCardNumber = json['idCardNumber'] ?? '';
    cityId = json['cityId'];
    adderss = json['adderss'];
    img = json['img'];
    password = pass ?? json['password'];
    userTypeAsString = json['userType'];
  }
}