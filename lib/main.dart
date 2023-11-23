import 'package:brainboost/Signup/welcomepage.dart';
import 'package:brainboost/StudentUI/screens/dashboard.dart';
import 'package:brainboost/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  firebaseUser = Rx<User?>(auth.currentUser);
  firebaseUser.bindStream(auth.userChanges());

  runApp(MaterialApp(
      home: firebaseUser.value == null? WelcomePage(): Dashboard()));
}

