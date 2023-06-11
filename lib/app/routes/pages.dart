import 'package:get/get.dart';
import 'package:reservations/app/home.dart';
import 'package:reservations/app/routes/routes.dart';
import 'package:reservations/app/splash.dart';
import 'package:reservations/app/view/auth/forget_password/forget_paasword_view.dart';
import 'package:reservations/app/view/auth/login/login_view.dart';
import 'package:reservations/app/view/encoding/encoding_view.dart';
import 'package:reservations/bindings/home_buinding.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.splash, page:()=> const Splash(),binding: SplashBinding()),
    GetPage(name: Routes.login, page:()=>  LoginScreen(),),
    GetPage(name: Routes.home, page: () =>  HomePage()),
    GetPage(name: Routes.encodingView, page: () =>  EncodingView()),
    GetPage(name: Routes.forgetPasswordView, page: () => ForgetPasswordView()),
  ];
}
