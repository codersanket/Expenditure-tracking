class UserService {
  String _uid;

  String get uid => _uid;

  set firebaseUid(String uid) {
    _uid = uid;
  }
}
