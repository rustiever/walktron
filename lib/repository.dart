import 'package:firebase_auth/firebase_auth.dart';

import 'services/firebaseServices.dart';

class Repository {
  final FirebaseService _service;
  Repository(this._service) : assert(_service != null);

  Future<UserCredential> login(String email, String password) =>
      _service.signInWithEmailAndPassword(email, password);
}
