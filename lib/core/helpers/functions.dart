import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokeapi/core/enums/request_state.dart';

import 'logger.dart';

class Functions {
  static Future<void> storeMethod({
    required Future Function() body,
    Function? onError,
    bool showNotification = true,
    bool showDialog = false,
    ValueChanged<RequestState>? resultState,
  }) async {
    assert(showNotification == true ? showDialog == false : true);

    try {
      await body();
    } catch (error) {
      Logger.log(title: 'APP', content: '$error');

      if (error is DioError) {
        Logger.log(title: 'APP', content: '${error.error}');
        Logger.log(title: 'APP', content: '${error.error.runtimeType}');
      }

      if (onError != null) onError();

      if ((error is DioError && error.error is String)) {
        String exception = 'Erro ao recuperar dados no servidor';

        if (error is DioError) {
          exception = 'Erro ao conectar com o servidor';
        }
      }
    }
  }
}
