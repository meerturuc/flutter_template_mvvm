import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter_template/core/base/model/base_error.dart';
import 'package:flutter_template/core/base/model/base_model.dart';
import 'package:flutter_template/core/constants/enums/locale_keys_enum.dart';
import 'package:flutter_template/core/init/cache/locale_maganer.dart';

class NetworkManager {
  static NetworkManager _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  NetworkManager._init() {
    final baseOptions = BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
        headers: {
          'val': LocaleManager.instance.getStringvalue(PreferencesKeys.TOKEN)
        });
    _dio = Dio(baseOptions);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.path += 'veli';
      },
      //onResponse: (e, handler) {
      //  return e.data;
      //},
      onError: (e, handler) {
        return BaseError(e.message);
      },
    ));
  }

  Dio _dio;

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responeBody = response.data;

        if (responeBody is List) {
          return responeBody.map((e) => model.fromJson(e)).toList();
        } else if (responeBody is Map) {
          return model.fromJson(responeBody);
        }
        return responeBody;

        break;
      default:
    }
  }
}
