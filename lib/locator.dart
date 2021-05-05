import 'package:expenditure_tracking/services/Auth%20Services/auth_services.dart';
import 'package:expenditure_tracking/services/Firestore%20Services/firestore_services.dart';
import 'package:expenditure_tracking/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setUpLocator() {
  locator.registerLazySingleton<AuthServices>(() => AuthServices());
  locator.registerLazySingleton<FirestoreServices>(() => FirestoreServices());
  locator.registerLazySingleton(() => UserService());
  
}
