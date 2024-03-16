import 'package:brainboost/UI/Signup/loginPage.dart';
import 'package:brainboost/UI/Signup/welcomepage.dart';
import 'package:brainboost/UI/StudentUI/screens/dashboard.dart';
import 'package:brainboost/UI/TeachersUI/TeachersHomepage.dart';
import 'package:brainboost/data%20model/user_model.dart';
import 'package:brainboost/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<UserModel> fetchUserData() async {
    print("object");
    String? useremail = auth.currentUser?.email;
    final db = FirebaseFirestore.instance;

    final snapshot = await db
        .collection("Users")
        .where("useremail", isEqualTo: useremail)
        .get();
    final usermodel =
        snapshot.docs.map((e) => UserModel.fromshapshot(e)).single;
    return usermodel;
  }

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: NewUserDataCollection(),
    home: firebaseUser.value == null
        ? WelcomePage()
        : FutureBuilder(
            future: fetchUserData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userdata = snapshot.data as UserModel;
                  print(userdata.studentTeacher);
                  if (userdata.studentTeacher == "Teacher") {
                    return TeachersHomepage();
                  }
                } 
              } 
              return Dashboard();
            },
          ),
  ));
}
