
import 'package:reservations/app/data/models/app_languge.dart';
import 'package:reservations/app/data/models/user.dart';

class AppMasks {
  AppMasks._();
  static String token ='';
  static String clientKey ='';
  static String uniqKey ='';
  static String userType ='';
  static String phoneNumber ='';
  static String pass ='';
  static UserModel profile =UserModel();
  static List<LangugeModel> appLanguge = [
    LangugeModel(
        langugeId: '1',
        langugeName: 'عربي',
        langugeCode: 'ar',
        langugeFlagCode: 'SA'),
    LangugeModel(
        langugeId: '2',
        langugeName: 'English',
        langugeCode: 'en',
        langugeFlagCode: 'GB')
  ];
}