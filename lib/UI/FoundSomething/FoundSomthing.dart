import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:freemium/UI/Widgets/Widgets.dart';
import 'package:image_picker/image_picker.dart';

class FoundSomething extends StatefulWidget {
  FoundSomething({Key key}) : super(key: key);

  @override
  _FoundSomethingState createState() => _FoundSomethingState();
}

class _FoundSomethingState extends State<FoundSomething> {
  final ImagePicker _picker = ImagePicker();
  bool imagetaken = false;
  File image;
  String itemname;
  String itemwhere;
  String itemdesc;
  TextEditingController itemnamec = TextEditingController();
  TextEditingController itemwherec = TextEditingController();
  TextEditingController itemdescc = TextEditingController();

  ReusableWidgets reusableWidgets = ReusableWidgets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: reusableWidgets.appbar(context, "Found Something"),
        body: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              child: Column(children: [
                Container(
                  color: Colors.grey[200],
                  height: 1,
                ),
                SizedBox(
                  height: h(53),
                ),
                reusableWidgets.container(itemnamec, (val) {
                  itemname = val;
                }, "Item Name", "name"),
                SizedBox(
                  height: h(20),
                ),
                reusableWidgets.container(itemwherec, (val) {
                  itemwhere = val;
                }, "Where did you find the item?", "name"),
                SizedBox(
                  height: h(20),
                ),
                typingContainer(itemdescc, itemdesc),
                SizedBox(
                  height: (30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        chooseImage(false);
                      },
                      child: Container(
                        height: h(37),
                        width: w(160),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.gradient1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                                "assets/images/Icon awesome-upload.svg"),
                            Text(
                              "Upload Photo",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: "SFPRO"),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        chooseImage(true);
                      },
                      child: Container(
                        height: h(37),
                        width: w(160),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.gradient1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                                "assets/images/Icon awesome-camera.svg"),
                            Text(
                              "Take a Photo",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: "SFPRO"),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: (20),
                ),
                image != null
                    ? Container(
                        height: h(100),
                        width: w(150),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.gradient1),
                            image: DecorationImage(image: FileImage(image))))
                    : Container(),
                image == null
                    ? SizedBox(
                        height: h(100),
                      )
                    : SizedBox(
                        height: h(10),
                      ),
                reusableWidgets.submitbutton("Submit", AppColor.button)
              ])),
        ));
  }

  chooseImage(bool iscamera) async {
    // ignore: deprecated_member_use
    final pickedfile = await _picker.getImage(
        source: iscamera ? ImageSource.camera : ImageSource.gallery);
    // ignore: deprecated_member_use
    if (pickedfile != null) {
      image = File(pickedfile.path);
      setState(() {});
    }
  }

  Widget showImage(File img) {
    return img != null
        ? Container(
            height: 100,
            width: 100,
            decoration:
                BoxDecoration(image: DecorationImage(image: FileImage(img))))
        : Container();
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}

Widget typingContainer(
    TextEditingController textEditingController, String inputtext) {
  return Column(
    children: [
      Row(
        children: [
          SizedBox(
            width: ScreenUtil().setWidth(25.1),
          ),
          Text(
            "Item description",
            style: TextStyle(
                color: AppColor.hintcolor,
                fontSize: 16.sp,
                fontFamily: 'SFPRO'),
          ),
        ],
      ),
      SizedBox(
        height: ScreenUtil().setHeight(12),
      ),
      Container(
        height: ScreenUtil().setHeight(137),
        width: ScreenUtil().setWidth(327),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColor.container,
        ),
        child: TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: 10,
          controller: textEditingController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            border: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
          ),
          onChanged: (value) => inputtext = value,
        ),
      ),
    ],
  );
}
