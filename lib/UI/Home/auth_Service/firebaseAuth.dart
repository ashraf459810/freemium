// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:freemium/UI/Home/Home.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> register() async {  //////sign in with custom tokse method instead of anonymous   (token from back end)
//     final User user = (await _auth.signInAnonymously()).user;
//     if (user != null) {
//       print(user);
//     } else {
//       print("erro");
//     }
    
//   }

//     checkIfUserLoggedIn(context) async {
// //    await googleSignIn.signOut();
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
// //    sharedPreferences.setString("id", '');
//     bool userLoggedIn = (sharedPreferences.getString('id') ?? '').isNotEmpty;

//     if (userLoggedIn) {
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => Home()));
//     } else {
  
     
//     }
//   }

//     handleSignIn(context) async {
//        final googleSignIn = GoogleSignIn();

//   final firebaseAuth = FirebaseAuth.instance;
//     final res = await googleSignIn.signIn();

//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

//     final auth = await res.authentication;

//     final credentials = GoogleAuthProvider.credential(
//         idToken: auth.idToken, accessToken: auth.accessToken);

//     final firebaseUser =
//         (await firebaseAuth.signInWithCredential(credentials)).user;

//     if (firebaseUser != null) {
//       final result = (await FirebaseFirestore.instance
//               .collection('users')
//               .where('id', isEqualTo: firebaseUser.uid)
//               .get())
//           .docs;

//       if (result.length == 0) {
//         ///new user
//         FirebaseFirestore.instance
//             .collection('users')
//             .doc(firebaseUser.uid)
//             .set({
//           "id": firebaseUser.uid,
//           "name": firebaseUser.displayName,
//           "profile_pic": firebaseUser.photoURL,
//           "created_at": DateTime.now().millisecondsSinceEpoch,
//         });

//         sharedPreferences.setString("id", firebaseUser.uid);
//         sharedPreferences.setString("name", firebaseUser.displayName);
//         sharedPreferences.setString("profile_pic", firebaseUser.photoURL);

//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (context) => Home()));
//       } else {
//         ///Old user
//         sharedPreferences.setString("id", result[0]["id"]);
//         sharedPreferences.setString("name", result[0]["name"]);
//         sharedPreferences.setString("profile_pic", result[0]["profile_pic"]);

//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (context) => Home()));
//       }
//     }
//   }
// }