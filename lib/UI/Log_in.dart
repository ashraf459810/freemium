import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freemium/UI/Hom_e.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginn extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Loginn> {
  bool pageInitialised = false;

  final googleSignIn = GoogleSignIn();

  final firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    checkIfUserLoggedIn();
    super.initState();
  }

  checkIfUserLoggedIn() async {
//    await googleSignIn.signOut();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//    sharedPreferences.setString("id", '');
    bool userLoggedIn = (sharedPreferences.getString('id') ?? '').isNotEmpty;

    if (userLoggedIn) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Homee()));
    } else {
      setState(() {
        pageInitialised = true;
      });
    }
  }

  handleSignIn() async {
    final res = await firebaseAuth.signInAnonymously();
    print(res.user.uid);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

   
    if (res != null) {
      final result = (await FirebaseFirestore.instance
              .collection('users')
              .where('id', isEqualTo: res.user.uid)
              .get())
          .docs;

      if (result.length == 0) {
        ///new user
        FirebaseFirestore.instance
            .collection('users')
            .doc(res.user.uid)
            .set({
          "id": res.user.uid,
          "name": "name",
          "created_at": DateTime.now().millisecondsSinceEpoch,
        });

        sharedPreferences.setString("id", res.user.uid);
        sharedPreferences.setString("name", "name");

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Homee()));
      } else {
        ///Old user
        sharedPreferences.setString("id", result[0]["id"]);
        sharedPreferences.setString("name", result[0]["name"]);
    

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Homee()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (pageInitialised)
          ? Center(
              child: TextButton(
                child: Text('Sign in'),
                onPressed: handleSignIn,
              ),
            )
          : Center(
              child: SizedBox(
                height: 36,
                width: 36,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            ),
    );
  }
}