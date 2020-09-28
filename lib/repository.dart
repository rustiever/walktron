import 'package:walktron/models/userModel.dart';
import 'package:walktron/services/localService.dart';
import 'services/firebaseServices.dart';

class Repository {
  final FirebaseService _service;
  Repository(this._service) : assert(_service != null);

  UserModel getUser() => LocalService.instance.getUser();

  void login(String email, String password) =>
      _service.signInWithEmailAndPassword(email, password);

  void googleSignIn() => _service.signInWithGoogle();

  void signUp(String email, String password) =>
      _service.createUserWithEmailAndPassword(email, password);

  void logout() => _service.signOut();
}
