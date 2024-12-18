//photo

import 'package:easy_localization/easy_localization.dart';

extension Photo on String {
  String png([String? path = "images"]) => 'assets/$path/$this.png';
  String svg([String path = "icons"]) => 'assets/$path/$this.svg';
  String jpg([String path = "images"]) => 'assets/$path/$this.jpg';
  String jpeg([String path = "images"]) => 'assets/$path/$this.jpeg';
}

extension TimeFormat on String? {
  String get timeFormate {
    if (this == null) return "";
    DateTime date = DateTime.parse(this!);
    return DateFormat("dd-MM-yyyy hh:mm:ss", "en").format(date);
  }
  String get timeFormateHhmm {
    if (this == null) return "";
    DateTime date = DateTime.parse(this!);
    return DateFormat("hh:mm", "en").format(date);
  }
  String get timeFormateHhmmss {
    if (this == null) return "";
    DateTime date = DateTime.parse(this!);
    return DateFormat("hh:mm:ss", "en").format(date);
  }
  String get timeFormateHuman {
   if (this == null) return "";
    DateTime date = DateTime.parse(this!);
    return DateFormat("yyyy-MM-dd hh:mm:ss", "en").format(date);
  }
}
