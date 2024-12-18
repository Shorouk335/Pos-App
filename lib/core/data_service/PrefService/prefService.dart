import 'package:e_ticket_app/core/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PrefService { 

  static late SharedPreferences _preferences;

  static getInstance() async {
    _preferences = await SharedPreferences.getInstance();
  }

 ////////////appTheme///////////

 static String get appTheme => _preferences.getString(kAppTheme) ?? '';

 static set appTheme(String value) => _preferences.setString(kAppTheme, value);

 static  removeAppTheme()=> _preferences.setString(kAppTheme, ""); 

//////////////ItemStyle///////////

 static String get itemStyle => _preferences.getString(kItemStyle) ?? '';

 static set itemStyle(String value) => _preferences.setString(kItemStyle, value);

 static  removeItemStyle()=> _preferences.setString(kItemStyle, ""); 


}
