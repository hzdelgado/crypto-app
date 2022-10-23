// ignore: import_of_legacy_library_into_null_safe
import 'package:bancolombia_test/features/auth/data/models/firebase_response.dart';
import 'package:bancolombia_test/global_widgets/dialog/custom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../core/values/strings.dart';

class AuthManager {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final CustomDialog dialog = Get.find<CustomDialog>();

  Future<FirebaseResponse?> signIn(String email, String password) async {
    try {
      UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return FirebaseResponse(
          status: MessageStatus.Success.name, message: Strings.firebaseSuccessfulSignIn);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return FirebaseResponse(
            status: MessageStatus.Error.name,
            message: Strings.firebaseUserNotFound);
      } else if (e.code == 'wrong-password') {
        return FirebaseResponse(
            status: MessageStatus.Error.name,
            message: Strings.firebaseWrongPassword);
      }
    } catch (e) {
      return FirebaseResponse(
          status: MessageStatus.Error.name, message: "Algo salió mal");
    }
    return null;
  }

  Future<FirebaseResponse?> signUp(String email, String password) async {
    try {
    UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return FirebaseResponse(
          status: MessageStatus.Success.name, message: Strings.firebaseSuccessfulSignUp);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return FirebaseResponse(
            status: MessageStatus.Error.name,
            message: Strings.firebaseWeakPassword);
      } else if (e.code == 'email-already-in-use') {
        return FirebaseResponse(
            status: MessageStatus.Error.name,
            message: Strings.firebaseEmailAlreadyInUse);
      }
    } catch (e) {
      return FirebaseResponse(
          status: MessageStatus.Error.name, message: "Algo salió mal");
    }
    return null;
  }
}
