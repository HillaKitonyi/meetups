import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/domain/firestore/firestore_failures.dart';
import 'package:meetups/domain/firestore/meetup.dart';

final meetupsListProvider = StreamProvider.autoDispose<List<Meetup>>((_) {
  return FireStoreService.instance.watchMeetups();
}, name: 'meetupsListProvider');

final meetupProvider = StreamProvider.family.autoDispose<Meetup, String>((_, meetupID) {
  return FireStoreService.instance.watchMeetup(meetupID);
}, name: 'meetupProvider');

class FireStoreService {
  final FirebaseFirestore _firestore;
  FireStoreService._(this._firestore);

  static FireStoreService get instance => FireStoreService._(FirebaseFirestore.instance);

  CollectionReference<Meetup> meetupsCollection() {
    return _firestore.collection('meetups').withConverter(
          fromFirestore: (snapshot, options) {
            return snapshot.exists ? Meetup.fromJson(snapshot.data()!) : Meetup.initial();
          },
          toFirestore: (meetup, options) => meetup.toJson(),
        );
  }

  DocumentReference<Meetup> meetupDocument(String meetupID) {
    return meetupsCollection().doc(meetupID).withConverter(
          fromFirestore: (snapshot, options) {
            return snapshot.exists ? Meetup.fromJson(snapshot.data()!) : Meetup.initial();
          },
          toFirestore: (meetup, options) => meetup.toJson(),
        );
  }

  // C
  Future<Either<FirestoreFailure, Unit>> createMeetup(Meetup meetup) async {
    try {
      await meetupDocument(meetup.uid).set(meetup);
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        return left(const FirestoreFailure.permissionDenied());
      } else {
        return left(const FirestoreFailure.serverError());
      }
    }
  }

  // R
  Stream<List<Meetup>> watchMeetups() {
    return meetupsCollection()
        .snapshots()
        .map((qSnapshot) => qSnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList());
  }

  Stream<Meetup> watchMeetup(String meetupID) {
    return meetupDocument(meetupID)
        .snapshots()
        .map((docSnapshot) => docSnapshot.exists ? docSnapshot.data()! : Meetup.initial());
  }

  // U
  Future<Either<FirestoreFailure, Unit>> updateMeetup(Map<String, dynamic> meetup) async {
    try {
      await meetupDocument(meetup['uid']).update(meetup);
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        return left(const FirestoreFailure.permissionDenied());
      } else {
        return left(const FirestoreFailure.serverError());
      }
    }
  }

  // D
  Future<Either<FirestoreFailure, Unit>> deleteMeetup(String meetupID) async {
    try {
      await meetupDocument(meetupID).delete();
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        return left(const FirestoreFailure.permissionDenied());
      } else {
        return left(const FirestoreFailure.serverError());
      }
    }
  }
}
