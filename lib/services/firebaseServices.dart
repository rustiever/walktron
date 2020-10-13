import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:walktron/models/models.dart';
import 'package:walktron/services/localService.dart';

import '../router.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseService({FirebaseAuth firebaseAuth, GoogleSignIn googleSignin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignin ?? GoogleSignIn();

  Stream<User> get user => _firebaseAuth.authStateChanges();

  Future<void> _addUserToDB(UserCredential userCredential) async {
    final CollectionReference userCollection = _firestore.collection('users');
    final user = UserModel(
        name: userCredential.user.displayName,
        uid: userCredential.user.uid,
        height: null,
        weight: null,
        age: null);
    await userCollection.doc(userCredential.user.uid).set(user.toJson());
    // await _getUserFromDB(userCredential.user.uid);
  }

  Future<void> _getUserFromDB(String uid) async {
    final CollectionReference userCollection = _firestore.collection('users');
    final user = UserModel.fromJson(
      (await userCollection.doc(uid).get()).data(),
    );
    await LocalService.instance.save(user);
  }

  void authStateChanges() {
    _firebaseAuth.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  Future<void> signOut() async {
    try {
      print("firebase User Sign Out");
      print(LocalService.instance.getUser());
      await LocalService.instance.clearLocalData();
      if (_googleSignIn.currentUser != null) {
        await _googleSignIn.disconnect();
        await _googleSignIn.signOut();
      }
      await _firebaseAuth.signOut();
      await Get.offNamedUntil(loginRoute, (route) => false);
    } catch (e) {
      print('logout problem');
      print(e);
      Get.snackbar(
        'snack-5',
        'logout problem',
        duration: const Duration(milliseconds: 5),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      print(user);
      if (userCredential.additionalUserInfo.isNewUser) {
        await _addUserToDB(userCredential);
      }
      _getUserFromDB(userCredential.user.uid);
      await Get.toNamed(homeroute);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        // The account already exists with a different credential
        final String email = e.email;
        final AuthCredential pendingCredential = e.credential;

        // Fetch a list of what sign-in methods exist for the conflicting user
        final List<String> userSignInMethods =
            await _firebaseAuth.fetchSignInMethodsForEmail(email);

        // If the user has several sign-in methods,
        // the first method in the list will be the "recommended" method to use.
        if (userSignInMethods.first == 'password') {
          // Prompt the user to enter their password
          const String password = '...';

          // Sign the user in to their account with the password
          final UserCredential userCredential =
              await _firebaseAuth.signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          // Link the pending credential with the existing account
          await userCredential.user.linkWithCredential(pendingCredential);

          // Success! Go back to your application flow
          // return goToApplication();
        }
      }
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      // ignore: unused_local_variable
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await _addUserToDB(userCredential);
      await _getUserFromDB(userCredential.user.uid);
      await Get.toNamed(homeroute);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        // print(e.code);
        Get.snackbar(
          'snack-3',
          'The password provided is too weak.',
          duration: const Duration(milliseconds: 5),
          snackPosition: SnackPosition.TOP,
        );
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
        // print(e.code);
        Get.snackbar(
          'snack-4',
          'The account already exists for that email.',
          duration: const Duration(milliseconds: 5),
        );
      } else {
        print(e.code);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user);
      await _getUserFromDB(userCredential.user.uid);
      await Get.toNamed(homeroute);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        Get.snackbar(
          'snack-1',
          'No user found for that email.',
          duration: const Duration(milliseconds: 5),
          snackPosition: SnackPosition.TOP,
        );
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
        Get.snackbar(
          'snack-2',
          'Wrong password provided for that user.',
          duration: const Duration(milliseconds: 5),
          snackPosition: SnackPosition.TOP,
        );
      } else {}
    }
  }
}
