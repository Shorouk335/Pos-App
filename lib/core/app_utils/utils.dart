import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'injection.dart';
import '../api_service/dio_service.dart';

class Utils {
  //static objects
  static DioService dio()=> locator<DioService>();
  static Uuid uuid() => locator<Uuid>();
  static getId() {
    return uuid().v4();
  }

  // to rebuild all app when change language
  static rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}
