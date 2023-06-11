// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:dio/adapter.dart';
// import 'package:get/get.dart';
// import 'package:loader_overlay/loader_overlay.dart';
// import 'package:reservations/app/core/utils/helpers/handler_helper.dart';
// import 'package:reservations/app/core/utils/masks.dart';
// import 'package:reservations/app/data/inter_net_checker.dart';
// import 'package:reservations/app/data/url_path.dart';
// import 'package:dio/dio.dart';
// import 'package:reservations/langange/string.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
//
// class ServiceAPI {
//   bool s = Get.find<CheckInterNet>().interNet.value;
//   late String url;
//   late var dataSend;
//   static const _map = {"": ""};
//   ServiceAPI({required this.url, this.dataSend = _map});
//   Duration runTime = const Duration(seconds: 150);
//   static Dio dio = Dio();
//   static Options options = Options();
//   static setup() {
//     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//         (HttpClient client) {
//       client.badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//       return client;
//     };
//     dio.options.baseUrl = AppUrl.domain;
//     dio.options.sendTimeout = 300000;
//     dio.options.connectTimeout = 300000;
//     dio.options.receiveTimeout = 300000;
//     // dio.options.headers = {
//     // 'Content-Type': 'application/json',
//     //   "Accept": "text/plains",
//     //   "Ticket_Date": DateTime.now(),
//     //   "Accept-Language": Get.locale!=null?Get.locale!.languageCode:'ar',
//     //   "Authorization": "Bearer " +AppMasks.token.token
//     // };
//     dio.interceptors.add(PrettyDioLogger(
//         requestHeader: true,
//         responseHeader: true,
//         request: true,
//         requestBody: true,
//         responseBody: true,
//         error: true,
//         compact: true,
//         maxWidth: 200));
//   }
//
//   getData(
//       {required Function(dynamic data) onSuccess,
//       required Function(dynamic error) onError,
//       required Function() onRunTime,
//       Function()? noInterNet}) async {
//     if (Get.find<CheckInterNet>().interNet.value) {
//       try {
//         var response = await dio
//             .get(AppUrl.domain + url,
//                 options: Options(headers: {
//                   "Ticket_Data": DateTime.now().toString(),
//                   "Content-Type": "application/json",
//                   "Accept": "text/plains",
//                   "Accept-Language": Get.locale??"ar",
//                   "Authorization": "Bearer ${AppMasks.token}"
//                 }))
//             .timeout(runTime);
//         // ignore: unnecessary_null_comparison
//         if (response != null) {
//           onSuccess(response.data['data']);
//         } else {
//           onRunTime();
//         }
//       } on TimeoutException catch (_) {
//         onRunTime();
//       } on DioError catch (error) {
//         if (error.response != null &&
//             (error.response!.statusCode ?? 0) == 401) {
//           AppMasks.token = '';
//           getToken(
//               onSuccess: (data) {
//                 getData(
//                     onSuccess: onSuccess,
//                     onError: onError,
//                     onRunTime: onRunTime,
//                     noInterNet: noInterNet);
//               },
//               onError: (error) => onError(error),
//               onRunTime: onRunTime,
//               noInterNet: noInterNet);
//         } else {
//           Get.context!.loaderOverlay.hide();
//           onError(error.response.toString().length < 1000
//               ? (error.response!.data["messages"] ?? TranslateText.unKnowError)
//               : TranslateText.unKnowError);
//         }
//       }
//     } else {
//       if (noInterNet != null) noInterNet();
//     }
//   }
//
//   postData(
//       {required Function(dynamic data) onSuccess,
//       required Function(dynamic error) onError,
//         int getID=0,
//       required Function() onRunTime,
//       Function()? noInterNet}) async {
//     if (Get.find<CheckInterNet>().interNet.value) {
//       try {
//         var response = await dio
//             .post(AppUrl.domain + url,
//                 data: dataSend,
//                 options: Options(
//                   headers: {
//                     "Ticket_Data": DateTime.now().toString(),
//                     "Content-Type": "application/json",
//                     "Accept": "text/plains",
//                     "Accept-Language": Get.locale??"ar",
//                     "Authorization": "Bearer ${AppMasks.token}"
//                   },
//                 ))
//             .timeout(runTime);
//         // ignore: unnecessary_null_comparison
//         if (response != null) {
//           if(getID==1){
//             onSuccess(response.data);
//           }
//          else if(response.data['messages'].toString()=="[]"){
//             onSuccess(response.data['data']);
//           }else{
//             onSuccess(response.data['messages']);
//           }
//         } else {
//           onRunTime();
//         }
//       } on TimeoutException catch (_) {
//         onRunTime();
//       } on DioError catch (error) {
//         Get.context!.loaderOverlay.hide();
//         if (error.response.toString() != "null" || error.response != null) {
//           if ((error.response!.statusCode ?? 0) == 401) {
//             AppMasks.token = '';
//             getToken(
//                 onSuccess: (data) {
//                   postData(
//                       onSuccess: onSuccess,
//                       onError: onError,
//                       onRunTime: onRunTime,
//                       noInterNet: noInterNet);
//                 },
//                 onError: (error) => onError(error),
//                 onRunTime: onRunTime,
//                 noInterNet: noInterNet);
//           } else {
//                 onError(HandlerExptionsHepler.handle(error));
//           }
//         } else {
//           onError(TranslateText.unKnowError);
//         }
//       }
//     } else {
//       if (noInterNet != null) noInterNet();
//     }
//   }
// }
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:reservations/app/core/utils/helpers/handler_helper.dart';
import 'package:reservations/app/data/inter_net_checker.dart';
import 'package:reservations/app/data/url_path.dart';
import 'package:reservations/app/global_widgets/snakbar/erorr.dart';
import 'package:reservations/langange/string.dart';
class ServiceAPI {

  String url;
  Map<String, dynamic>? dataSend;
  List<Map<String,dynamic>>? sendList ;

  ServiceAPI({required this.url, this.dataSend,this.sendList});

  final Dio _dio = Dio();
  Duration runTime = const Duration(seconds: 180);

  postData({required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
    required Function() onRunTime,
    Function()? noInterNet}) async {
    if (Get.find<CheckInterNet>().interNet.value) {
      String s = "weblogic";
      String d = "weblogic321";
      String authorization = 'Basic ${base64Encode(utf8.encode('$s:$d'))}';
      print("11111111111111111111$authorization");
      print("uuuuuuuuuuuuuuuuuuuuu${AppUrl.domain + url}");
      print("uuuuuuuuuuuuuuuuuuuuu$dataSend");
      try {
        var response = await _dio
            .post(AppUrl.domain + url,
            data:dataSend,
            options: Options(headers: {
              'Content-Type': 'application/json',
              "Authorization": authorization ,
              // "Bearer":GlobalData.token.toString(),
              // "Authorization": authorization + GlobalData.token.toString()
            }))
            .timeout(runTime);
        print("rrrrrrrrrrrrrrr${response.data}");
        print("rrrrrrrrrrrrrrr${response.statusCode}");
        if (response != null && response.statusCode == 200) {
          if (response.data[0]["status"].toString() == "1"){
            print("data res ------- ${response.data} ");
            print("status code is: ${response.statusCode}");
            onSuccess(response.data);
          }else{
            onError(response.data[0]["stMsg"].toString());
          }

        }
        else {
          onRunTime();
          print('api run time ++++++++++++ ___ n');
        }
      } on TimeoutException catch (_) {
        onRunTime();
      } on DioError catch (error) {
        print("error api ==================${error.reactive}");
        print("error api ==================${error.message}");
        print("error api ==================${error.response}");
        print(" ==================$error");
        if (error.response != null) {
          onError(HandlerExptionsHepler.handle(error));
          print("error api ==================${error.error}");
          print("error api ==================${error.message}");
          print("error api ==================${error.response}");
          onError("لا يوجد لستجابه من السرفر${error.message}");
        }
        else {
          onError(TranslateText.error);
        }
      }
    } else {
      if (noInterNet != null) noInterNet();
    }
  }


}


