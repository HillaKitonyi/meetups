import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meetups/domain/storage/storage_failures.dart';

class FireStorageService {
  final FirebaseStorage _storage;
  FireStorageService._(this._storage);

  static FireStorageService get instance => FireStorageService._(FirebaseStorage.instance);

  Future<Either<StorageFailure, String>> storeUserImage(File image, String userID) async {
    final ref = _storage.ref('/users/$userID');
    try {
      final uploadTask = await ref.putFile(image);
      return right(await uploadTask.ref.getDownloadURL());
    } on FirebaseException catch (e) {
      return left(StorageFailure.serverError(e.message ?? e.toString()));
    }
  }
}
