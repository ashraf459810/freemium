



import 'package:flutter/material.dart';
import 'package:freemium/Core/Consts.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

class UploadPic extends StatefulWidget {
  final String phototag;

  UploadPic({this.phototag});

  @override
  UploadPicState createState() => UploadPicState();
}

class UploadPicState extends State<UploadPic> {
   final ImagePicker _picker = ImagePicker();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  

  File image;
  List<String> images = [];
  List<int> ids = [];
  chooseImage() async {
    // ignore: deprecated_member_use
    final pickedfile = await _picker.getImage(source: ImageSource.camera);
    // ignore: deprecated_member_use
    if (pickedfile != null) {
      image = File(pickedfile.path);
    }

    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() async {
    // ignore: deprecated_member_use
    showMessageInScaffold("Uploading...");
    if (image != null) {
    

    } 
    // setStatus('Uploading Image...');
    // if (null == tmpFile) {
    //   setStatus(errMessage);
    //   return;
  }

  Widget showImage() {
    return image != null
        ? Container(
            height: 100,
            width: 100,
            decoration:
                BoxDecoration(image: DecorationImage(image: FileImage(image))))
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: AppColor.container,
              title: Text("Upload your Image"),
            ),
            body: Container(
              padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // ignore: deprecated_member_use
                  OutlineButton(
                    onPressed: chooseImage,
                    child: Text('Choose Image'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  showImage(),
                  SizedBox(
                    height: 20.0,
                  ),
                  // ignore: deprecated_member_use
                  OutlineButton(
                    onPressed: startUpload,
                    child: Text('Upload Image'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    status,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            )),
        onWillPop: onWillPop);
  }

  void showMessageInScaffold(String message) {
    try {
      // ignore: deprecated_member_use
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
        backgroundColor: AppColor.container,
      ));
    } on Exception catch (e, s) {
      print(s);
    }
  }

  Future<bool> onWillPop() async {
    Navigator.pop(context, ids);
    return true;
  }
}
