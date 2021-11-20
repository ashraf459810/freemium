import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:freemium/UI/FoundSomething/FoundSomthing.dart';
import 'package:freemium/UI/FoundSomethingCommet/FoundSomethingComment.dart';
import 'package:freemium/UI/Widgets/Widgets.dart';

class LostFound extends StatefulWidget {
  LostFound({Key key}) : super(key: key);

  @override
  _LostFoundState createState() => _LostFoundState();
}

class _LostFoundState extends State<LostFound> {
  ReusableWidgets reusableWidgets = ReusableWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: reusableWidgets.appbar(context, "Lost & Found"),
        body: Container(
            color: Colors.white,
            child: Column(children: [
              Container(
                color: Colors.grey[200],
                height: 1,
              ),
              SizedBox(
                height: h(26.5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FoundSomething(),
                    )),
                    child: Container(
                      height: h(68),
                      width: w(336),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColor.gradient1,
                                AppColor.gradient3,
                                AppColor.gradient2
                              ])),
                      child: Center(
                        child: Text("Found Something?",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20.sp,
                                fontFamily: "SFPRO")),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h(45),
              ),
              Row(
                children: [
                  Container(
                    width: w(140),
                    child: Center(
                        child: Text(
                      "Lost Items",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontFamily: "SFPRO",
                          fontWeight: FontWeight.normal),
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: h(12),
              ),
              Container(
                height: h(319),
                width: w(329),
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FoundSomethingComment(),
                      )),
                      child: Column(
                        children: [
                          Container(
                            height: h(150),
                            child: Row(
                              children: [
                                Container(
                                  height: h(112),
                                  width: w(103),
                                  // decoration:
                                  //  BoxDecoration(
                                  //    boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey[200].withOpacity(0.5),
                                  //     spreadRadius: 1,
                                  //     blurRadius: 1,
                                  //     offset: Offset(
                                  //         1, 1), // changes position of shadow
                                  //   )
                                  // ]
                                  // ),
                                  child: Image.asset(
                                    "assets/images/Rectangle 92.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: w(3),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: h(50)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Teady Bear",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontFamily: "SFPRO",
                                            fontWeight: FontWeight.normal),
                                      ),
                                      SizedBox(
                                        height: h(4),
                                      ),
                                      Text(
                                        "12 Dec, 2020",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontFamily: "SFPRO",
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Container(
                                        width: w(150),
                                        child: Text(
                                          "Found this brown wallet on floor 13.",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontFamily: "SFPRO",

                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.grey[200],
                            height: 1,
                            width: w(350),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ])));
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
