import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chatpage.dart';

class Homee extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Homee> {
  GoogleSignIn googleSignIn = GoogleSignIn();
  String userId;

  @override
  void initState() {
    getUserId();
    super.initState();
  }

  getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    userId = sharedPreferences.getString('id');
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            TextButton(
              child: Text('Logout'),
              onPressed: () async {
                await googleSignIn.signOut();
                SharedPreferences sharedPrefs =
                    await SharedPreferences.getInstance();
                sharedPrefs.setString('id', '');
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Support').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
              
                itemBuilder: (listContext, index) =>
                    buildItem(
                      snapshot.data.docs[index]),
                itemCount: snapshot.data.docs.length,
              );
            }

            return Container();
          },
        ));
  }

  buildItem(doc) {
    return (userId != doc['id'])
        ? GestureDetector(
            onTap: () {
              print(doc["id"]);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatPage(docs: doc)));
            },
            child: Card(
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Text(doc['name']),
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}
