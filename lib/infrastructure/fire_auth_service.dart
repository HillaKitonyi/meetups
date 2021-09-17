import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meetups/domain/auth/app_user.dart';
import 'package:meetups/domain/auth/auth_failure.dart';

class FireAuthService {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  FireAuthService._(this._auth, this._googleSignIn);

  static FireAuthService get instance => FireAuthService._(
        FirebaseAuth.instance,
        GoogleSignIn.standard(),
      );

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return left(const AuthFailure.wrongEmailPassword());
      } else if (e.code == 'too-many-attempts') {
        return left(const AuthFailure.tooManyRequests());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleAccount = await _googleSignIn.signIn();
      if (googleAccount == null) return left(const AuthFailure.cancelled());
      final googleAuth = await googleAccount.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  Stream<Option<AppUser>> appUserStream() {
    return _auth
        .authStateChanges()
        .map((user) => user == null ? none() : some(AppUser.fromFirebaseUser(user)));
  }

  Future<void> logout() async {
    await Future.wait([_auth.signOut(), _googleSignIn.signOut()]);
  }
}
