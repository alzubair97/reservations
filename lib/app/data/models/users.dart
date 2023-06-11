class UsersModel {
  int? pin;
  String? id;
  String? fullName;
  bool? emailConfirmed;
  bool? isActive;
  String? password;
  String? confirmPassword;
  bool? phoneNumberConfirmed;
  String? countryId;
  String? cityId;
  String? state;
  String? street;
  String? address;
  String? zipCode;
  String? phoneNumber;
  String? email;
  String? language;
  String? birthDate;
  String? gender;
  String? imageUrl;
  Imagee? image;

  UsersModel(
      {this.pin,
        this.id,
        this.fullName,
        this.emailConfirmed,
        this.password,
        this.confirmPassword,
        this.phoneNumberConfirmed,
        this.isActive,
        this.countryId,
        this.cityId,
        this.state,
        this.street,
        this.address,
        this.zipCode,
        this.phoneNumber,
        this.email,
        this.language,
        this.birthDate,
        this.gender,
        this.imageUrl,
        this.image});

  UsersModel.fromJson(Map<String, dynamic> json) {
    pin = json['pin'];
    id = json['id'];
    fullName = json['fullName'];
    isActive = json['isActive']??false;
    emailConfirmed = json['emailConfirmed'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    phoneNumberConfirmed = json['phoneNumberConfirmed'];
    countryId = json['countryId'];
    cityId = json['cityId'];
    state = json['state'];
    street = json['street'];
    address = json['address'];
    zipCode = json['zipCode'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    language = json['language'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    imageUrl = json['imageUrl'];
    image = json['image'] != null ? Imagee.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pin'] = pin;
    data['id'] = id;
    data['fullName'] = fullName;
    data['emailConfirmed'] = emailConfirmed;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    data['phoneNumberConfirmed'] = phoneNumberConfirmed;
    data['countryId'] = countryId;
    data['cityId'] = cityId;
    data['state'] = state;
    data['street'] = street;
    data['address'] = address;
    data['zipCode'] = zipCode;
    data['isActive'] = isActive;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['language'] = language;
    data['birthDate'] = birthDate;
    data['gender'] = gender;
    data['imageUrl'] = imageUrl;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
  Map<String, dynamic> toJsonUpdate() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['countryId'] = countryId;
    data['cityId'] = cityId;
    data['phoneNumber'] = phoneNumber;
    data['pin'] = pin;
    data['language'] = language;
    data['email'] = email;
    data['address'] = address;
    data['birthDate'] = birthDate;
    data['isActive'] = isActive;
    data['phoneNumberConfirmed'] = phoneNumberConfirmed;
    data['emailConfirmed'] = emailConfirmed;
    data['imageUrl'] = imageUrl;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
  Map<String, dynamic> creteUser() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['countryId'] = countryId;
    data['cityId'] = cityId;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['confirmPassword'] = confirmPassword;
    data['password'] = password;

    return data;
  }
}

class Imagee {
  String? name;
  String? extension;
  String? data;

  Imagee({this.name, this.extension, this.data});

  Imagee.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    extension = json['extension'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['extension'] = extension;
    data['data'] = this.data;
    return data;
  }
}
