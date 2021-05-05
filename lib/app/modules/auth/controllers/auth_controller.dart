import 'package:expenditure_tracking/Utills/snacbar_utills.dart';
import 'package:expenditure_tracking/app/controller.dart';
import 'package:expenditure_tracking/locator.dart';
import 'package:expenditure_tracking/services/Auth%20Services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends LoadingController {
  Rxn<User> _firebaseUser = Rxn<User>();

  User get firebaseUser => _firebaseUser.value;
  FirebaseAuth _auth = FirebaseAuth.instance;

  AuthServices _authServices = locator<AuthServices>();

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> login() async {
    try {
      setState(true);
      await _authServices.login();
      setState(false);
    } on FirebaseAuthException catch (e) {
      Utills().showSnackBar("Error", e.message);
      setState(false);
    }
  }

  Future<void> logOut() async {
    try {
      await _authServices.logout();
    } on FirebaseAuthException catch (e) {
      Utills().showSnackBar("Error", e.message);
    }
  }
}
