import 'package:e_ticket_app/core/app_utils/regex.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomValidation {
  
  static String? emailValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("email_required".tr());
      } else if (!(RegexApp().emailReg.hasMatch(value.trim()))) {
        return ("email_invalid".tr());
      } else if (value
          .trim()
          .split("@")[0]
          .replaceAll(RegExp(r'[0-9]'), "")
          .isEmpty) {
        return ("email_invalid".tr());
      } else {
        return null;
      }
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("password_required".tr());
      }
      // if (value.length < 8) {
      //   return ("password_short".tr(args: [8.toString()]));
      // }
    }
    return null;
  }

  static String? newPasswordValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("new_password_required".tr());
      }
      //   if (value.length < 8) {
      //   return ("password_short".tr(args: [8.toString()]));
      // }
    }
    return null;
  }
  
  static String? workValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("work_required".tr());
      }
    }
    return null;
  }
  static String? normalValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("this_field_is_required".tr());
      }
    }
    return null;
  }
  

   
   
   
   
   
   
   
   
   
   static String? confirmNewpasswordValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("confirm_new_password_required".tr());
      }
      //   if (value.length < 8) {
      //   return ("password_short".tr(args: [8.toString()]));
      // }
    }
    return null;
  }









  static String? phoneValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("phone_requird".tr());
      }
    }
    return null;
  }

  static String? nameValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("name_requird".tr());
      }
    }
    return null;
  }

  static String? countrydValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("country_requird".tr());
      }
    }
    return null;
  }

  static String? messageValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("message_is_requird".tr());
      }
    }
    return null;
  }

  static String? packageValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ("subscript_is_requird".tr());
      }
    }
    return null;
  }
}
