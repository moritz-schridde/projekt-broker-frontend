import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/root.dart';
import 'package:projekt_broker_frontend/services/firebase_auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseAuthService.firebaseOptions,
  );
  runApp(const Root());
}
