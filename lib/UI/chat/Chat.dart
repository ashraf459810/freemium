// import 'dart:async';
// import 'dart:io';


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dash_chat/dash_chat.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:freemium/Core/Consts.dart';
// import 'package:image_picker/image_picker.dart';

// class Chat extends StatefulWidget {
//   Chat({Key key}) : super(key: key);

//   @override
//   _ChatState createState() => _ChatState();
// }

// class _ChatState extends State<Chat> {
//    final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

//   final ChatUser user = ChatUser(
//     name: "Fayeed",
//     uid: "123456789",
//     avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
//   );

//   final ChatUser otherUser = ChatUser(
//     name: "Mrfatty",
//     uid: "25649654",
//   );

//   List<ChatMessage> messages = <ChatMessage>[];
//   var m = <ChatMessage>[];

//   var i = 0;
//   @override
//   void initState() { 
//     super.initState();
    
//   }

//     void systemMessage() {
//     Timer(Duration(milliseconds: 300), () {
//       if (i < 6) {
//         setState(() {
//           messages = [...messages, m[i]];
//         });
//         i++;
//       }
//       Timer(Duration(milliseconds: 300), () {
//         _chatViewKey.currentState.scrollController
//           ..animateTo(
//             _chatViewKey
//                 .currentState.scrollController.position.maxScrollExtent,
//             curve: Curves.easeOut,
//             duration: const Duration(milliseconds: 300),
//           );
//       });
//     });
//   }

//   void onSend(ChatMessage message) {
//     print(message.toJson());
//     FirebaseFirestore.instance
//         .collection('messages')
//         .doc(DateTime.now().millisecondsSinceEpoch.toString())
//         .set(message.toJson());
//     /* setState(() {
//       messages = [...messages, message];
//       print(messages.length);
//     });
//     if (i == 0) {
//       systemMessage();
//       Timer(Duration(milliseconds: 600), () {
//         systemMessage();
//       });
//     } else {
//       systemMessage();
//     } */
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//       backgroundColor: Colors.white,
//       elevation: 1,
//       leading: IconButton(
//         icon: Icon(
//           Icons.arrow_back_ios,
//           color: Colors.black,
//         ),
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//       ),
//       centerTitle: true,
//       title: Text(
//         "Management ",
//         style: TextStyle(
//             color: AppColor.register, fontSize: 20.sp, fontFamily: 'SFPRO'),
//       ),

//       // ...
//     ),
//       body: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection('messages')
//               .orderBy("createdAt")
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(
//                   black,
//                   ),
//                 ),
//               );
//             } else {
//               List<DocumentSnapshot> items = snapshot.data.docs;
//               var messages =
//                   items.map((i) => ChatMessage.fromJson(i.data())).toList();
//               return DashChat(
              
//                 key: _chatViewKey,
//                 inverted: false,
//                 onSend: onSend,
//                 sendOnEnter: true,
               
//                 textInputAction: TextInputAction.send,
//                 user: user,
//                 inputDecoration:
//                     InputDecoration.collapsed(hintText: "Add message here...",),
//                 // dateFormat: DateFormat('yyyy-MMM-dd'),
//                 // timeFormat: DateFormat('HH:mm'),
//                 messages: messages,
//                 showUserAvatar: false,
          
//                 showAvatarForEveryMessage: false,
//                 scrollToBottom: false,
//                 onPressAvatar: (ChatUser user) {
//                   print("OnPressAvatar: ${user.name}");
//                 },
//                 onLongPressAvatar: (ChatUser user) {
//                   print("OnLongPressAvatar: ${user.name}");
//                 },
//                 inputMaxLines: 5,
//                 messageContainerDecoration: BoxDecoration(color: AppColor.gradient2),
//                 messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
//                 alwaysShowSend: true,
    
//                 inputTextStyle: TextStyle(fontSize: 16.0.sp,color: Colors.black),
//                 inputContainerStyle: BoxDecoration(
//                   border: Border.all(width: 0.0),
//                   color: Colors.white,
          
//                 ),
//                 onQuickReply: (Reply reply) {
//                   setState(() {
//                     messages.add(ChatMessage(
//                         text: reply.value,
//                         createdAt: DateTime.now(),
//                         user: user));

//                     messages = [...messages];
//                   });

//                   Timer(Duration(milliseconds: 300), () {
//                     _chatViewKey.currentState.scrollController
//                       ..animateTo(
//                         _chatViewKey.currentState.scrollController.position
//                             .maxScrollExtent,
//                         curve: Curves.easeOut,
//                         duration: const Duration(milliseconds: 300),
//                       );

//                     if (i == 0) {
//                       systemMessage();
//                       Timer(Duration(milliseconds: 600), () {
//                         systemMessage();
//                       });
//                     } else {
//                       systemMessage();
//                     }
//                   });
//                 },
//                 onLoadEarlier: () {
//                   print("laoding...");
//                 },
//                 shouldShowLoadEarlier: false,
//                 showTraillingBeforeSend: true,
//                 trailing: <Widget>[
//                   IconButton(
//                     icon: Icon(Icons.photo),
//                     onPressed: () async {
//                       final picker = ImagePicker();
//                       PickedFile result = await picker.getImage(
//                         source: ImageSource.gallery,
//                         imageQuality: 80,
//                         maxHeight: 400,
//                         maxWidth: 400,
//                       );

//                       if (result != null) {
//                         final Reference storageRef =
//                             FirebaseStorage.instance.ref().child("chat_images");

//                         final taskSnapshot = await storageRef.putFile(
//                           File(result.path),
//                           SettableMetadata(
//                             contentType: 'image/jpg',
//                           ),
//                         );

//                         String url = await taskSnapshot.ref.getDownloadURL();

//                         ChatMessage message =
//                             ChatMessage(text: "", user: user, image: url);

//                         FirebaseFirestore.instance
//                             .collection('messages')
//                             .add(message.toJson());
//                       }
//                     },
//                   )
//                 ],
//               );
//             }
//           }),);
//   }
// }

// double h(double h) {
//   return ScreenUtil().setHeight(h);
// }

// double w(double w) {
//   return ScreenUtil().setWidth(w);
// }
