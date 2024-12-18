import 'package:uuid/uuid.dart';
import '../api_service/dio_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {  
   // dio
  locator.registerSingleton<DioService>(DioService());
  // uuid  
  locator.registerSingleton<Uuid>(const Uuid()); 




}



