import 'package:e_ticket_app/core/router/router.dart';

class NavigationService {
  static Future pushNamed(String name,
      {Object? extra,
      Map<String, String> pathParameters = const <String, String>{},
      Map<String, dynamic> queryParameters = const <String, dynamic>{}}) {
   return AppRouter.goRoute.pushNamed(
      name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  static Future pushReplacement(String name, {Object? extra}) {
   return AppRouter.goRoute.pushReplacement(
      name,
      extra: extra,
    );
  }

  static goNamed(String name,
      {Object? extra,
      Map<String, String> pathParameters = const <String, String>{},
      Map<String, dynamic> queryParameters = const <String, dynamic>{}}) {
    AppRouter.goRoute.goNamed(
      name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  static popPage() {
    AppRouter.goRoute.pop();
  }

  
}
