import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:freemium/UI/Widgets/Widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  final docs;

  const ChatPage({Key key, this.docs}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ReusableWidgets reusableWidgets = ReusableWidgets();
  String groupChatId;
  String userID;

  TextEditingController textEditingController = TextEditingController();

  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    getGroupChatId();
    super.initState();
  }

  getGroupChatId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    userID = sharedPreferences.getString('id');
    print(userID);

    String anotherUserId = widget.docs['id'];

    if (userID.compareTo(anotherUserId) > 0) {
      groupChatId = '$userID - $anotherUserId';
    } else {
      groupChatId = '$anotherUserId - $userID';
    }
    setState(() {});
    print(groupChatId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableWidgets.appbar(context, "Support"),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('messages')
            .doc(groupChatId)
            .collection(groupChatId)
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Column(
              children: <Widget>[
                Expanded(
                    child: ListView.builder(
                  controller: scrollController,
                  itemBuilder: (listContext, index) =>
                      buildItem(snapshot.data.docs[index]),
                  itemCount: snapshot.data.docs.length,
                  reverse: true,
                )),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration:
                            InputDecoration(hintText: "Add your message"),
                        textInputAction: TextInputAction.go,
                        controller: textEditingController,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.send,
                        color: AppColor.gradient1,
                      ),
                      onPressed: () => sendMsg(),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Center(
                child: SizedBox(
              height: 36,
              width: 36,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ));
          }
        },
      ),
    );
  }

  sendMsg() {
    String msg = textEditingController.text.trim();

    /// Upload images to firebase and returns a URL
    if (msg.isNotEmpty) {
      print('thisiscalled $msg');
      var ref = FirebaseFirestore.instance
          .collection('messages')
          .doc(groupChatId)
          .collection(groupChatId)
          .doc(DateTime.now().millisecondsSinceEpoch.toString());

      FirebaseFirestore.instance.runTransaction((transaction) async {
        transaction.set(ref, {
          "senderId": userID,
          "anotherUserId": widget.docs['id'],
          "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
          'content': msg,
          "type": 'text',
        });
      });

      scrollController.animateTo(0.0,
          duration: Duration(milliseconds: 100), curve: Curves.bounceInOut);
    } else {
      print('Please enter some text to send');
    }
    textEditingController.clear();
  }

  buildItem(doc) {
    
    return Padding(
      padding: EdgeInsets.only(
          top: 8.0,
          left: ((doc['senderId'] == userID) ? 64 : 0),
          right: ((doc['senderId'] == userID) ? 0 : 64)),
          child:
    Container(
      width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: ((doc['senderId'] == userID)
                ? AppColor.container
                : AppColor.button),
          
        borderRadius: BorderRadius.circular(10.0)),
      child: (doc['type'] == 'text')
          ? SizedBox(
            
              child: Container( width: 0.0 +textEditingController.text.length,
                color : AppColor.container,
                child: Text(
                  
                  '${doc['content']}',
                  style: TextStyle(fontSize: 18.sp),
                ),
              ))
          : Image.network(doc['content']),
    ));
  }
}
