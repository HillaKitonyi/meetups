import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meetups/domain/storage/storage_failures.dart';

class StoragePath {
  static String users(String userID) => 'users/$userID';
  static String meetups(String meetupID) => 'meetups/$meetupID';
}

class FireStorageService {
  final FirebaseStorage _storage;
  FireStorageService._(this._storage);

  static FireStorageService get instance => FireStorageService._(FirebaseStorage.instance);

  Future<Either<StorageFailure, String>> storeUserImage(File image, String path) async {
    final ref = _storage.ref(path);
    try {
      final uploadTask = await ref.putFile(image);
      return right(await uploadTask.ref.getDownloadURL());
    } on FirebaseException catch (e) {
      return left(StorageFailure.serverError(errMessage: e.message ?? e.toString()));
    }
  }
}
