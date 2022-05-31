import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:subscribed_stream/subscribed_stream.dart';

/// Service for managing all Firebase Authentication
///
/// Provides a [User] Stream to the MaterialApp, which holds the currently logged in User.
class FirebaseAuthService with ChangeNotifier {
  // @Deprecated("use DefaultFirebaseOptions.currentPlatform instead")
  // static const firebaseOptions = FirebaseOptions(
  //   apiKey: "AIzaSyA9QsR0KtSgZ7HpDurFxjAtnJ4Kz9djg6A",
  //   authDomain: "projekt-wertpapierhandel.firebaseapp.com",
  //   projectId: "projekt-wertpapierhandel",
  //   storageBucket: "projekt-wertpapierhandel.appspot.com",
  //   messagingSenderId: "783713235828",
  //   appId: "1:783713235828:web:3edd85505bbdb9a943b221",
  // );

  static const providerConfigurations = [
    EmailProviderConfiguration(),
    GoogleProviderConfiguration(
      clientId:
          "783713235828-1s02fmno1tg37v2i3ur36lu2r3qor3cv.apps.googleusercontent.com",
    ),
  ];

  late final SubscribedStream<User?> _subscribedUserStream;

  late final FirebaseAuth _firebaseAuth;

  FirebaseAuthService() {
    _firebaseAuth = FirebaseAuth.instance;
    _subscribedUserStream = SubscribedStream<User?>(
      stream: _firebaseAuth.authStateChanges(),
      onStreamEvent: (data, previous, _) {
        notifyListeners();
        return data;
      },
    );
  }

  ///Emits the current Firebase User as a [User] or [Null] if no User is signed in
  Stream<User?> get authStateChanges => _subscribedUserStream.stream;

  ///Signs out the current User
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> getBearerToken() async {
    return await _subscribedUserStream.latestValue?.getIdToken();
  }
}
