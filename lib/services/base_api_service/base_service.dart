// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import '../success_err_snackbar.dart';
import 'base_api_constants.dart';

class BaseService extends BaseApiConstants {
  Future<dynamic> responseHandle<T>({
    required Function request,
    required Function(Response response) callBackSuccess,
    Function(dynamic responseJson)? optionalCallBackError,
  }) async {
    Response? response;
    try {
      response = await request();

      if (response != null) {
       print(response.body);
        var responseJson = jsonDecode(response.body);
        if (responseJson['errorMsg'] == null) {
          return await callBackSuccess(response);
        } else {
          if (optionalCallBackError != null) {
            return await optionalCallBackError(responseJson);
          } else {
            SuccessAndErrSnackBar.errSnackBar(responseJson["errorMsg"]);
            return returnGenericType(T);
          }
        }
      } else {
        return returnGenericType(T);
      }
    } on SocketException {
      SuccessAndErrSnackBar.errSnackBar(connectionProblemMessage);
      return returnGenericType(T);
    } catch (e) {
      SuccessAndErrSnackBar.errSnackBar(otherProblemMessage + ' ' + '\n ${response == null ? "" : response .statusCode}:' + e.toString());
      print(e.toString());
      return returnGenericType(T);
    } finally {

      // if (response != null) {
      //   print(response.request!.url.toString());
      //   print(response.request!.method.toString());
      //   print('${response.statusCode}');
      // }
    }
  }

  returnGenericType<T>(T t) {
    if (t == bool) {
      return false;
    } else {
      return T;
    }
  }

  Uri getUriParseUrl({required String path}) {
    return Uri.parse(apiBaseUrl + path);
  }

  Map<String, String> getTokenHeader(String userToken) {
    return {
      "Content-Type": contentType,
      "Authorization": "Bearer " + userToken
    };
  }

  Map<String, String> get getTokenlessHeader {
    return {
      "Content-Type": contentType,
    };
  }
}
