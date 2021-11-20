import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:freemium/UI/Widgets/Widgets.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  ReusableWidgets reusableWidgets = ReusableWidgets();
  bool box1 = true;
  bool box2 = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: reusableWidgets.appbar(context, "Payment"),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 1,
              width: size.width,
              color: Colors.grey[300],
            ),
            SizedBox(
              height: h(25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    box1 = true;
                    box2 = false;
                    setState(() {});
                  },
                  child: Container(
                    height: h(68),
                    width: w(160),
                    decoration: box1
                        ? BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  AppColor.gradient1,
                                  AppColor.gradient3,
                                  AppColor.gradient2
                                ]))
                        : BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border: Border.all(color: AppColor.gradient1)),
                    child: Center(
                        child: Text("Electricity Bill",
                            style: box1
                                ? TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20.sp,
                                    fontFamily: "SFPRO")
                                : TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20.sp,
                                    fontFamily: "SFPRO"))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    box2 = true;
                    box1 = false;
                    setState(() {});
                  },
                  child: Container(
                    height: h(68),
                    width: w(160),
                    decoration: box2
                        ? BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  AppColor.gradient1,
                                  AppColor.gradient3,
                                  AppColor.gradient2
                                ]))
                        : BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border: Border.all(color: AppColor.gradient1)),
                    child: Center(
                        child: Text("Building Services",
                            style: box1
                                ? TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20.sp,
                                    fontFamily: "SFPRO")
                                : TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20.sp,
                                    fontFamily: "SFPRO"))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h(20),
            ),
            Row(
              children: [
                SizedBox(
                  width: w(26),
                ),
                Text("Unpaid",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontFamily: "SFPRO",
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  width: w(230),
                ),
                SvgPicture.asset("assets/images/Ellipse 21.svg"),
              ],
            ),
            SizedBox(
              height: h(12),
            ),
            Container(
              height: 1,
              width: w(350),
              color: Colors.grey[300],
            ),
            SizedBox(
              height: h(14.5),
            ),
            Container(
               height: h(185),
                  width: size.width,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  
                  return Container(
                   
                    child: Column(
                      children: [
                        SizedBox(height: h(4),),
                        Row(
                          children: [
                            SizedBox(
                              width: w(29),
                            ),
                            Text("January 30, 2021",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: "SFPRO",
                                )),
                             
                          ],
                        ),
                        SizedBox(height: h(6),),
                        Row(
                          children: [
                            SizedBox(
                              width: w(29),
                            ),
                            Text("#1864",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: "SFPRO",
                                )),
                          ],
                        ),
                        SizedBox(height: h(6),),
                        Row(
                          children: [
                            SizedBox(
                              width: w(29),
                            ),
                            Text("Total",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: "SFPRO",
                                )),
                            SizedBox(
                              width: w(199),
                            ),
                            Text("50,250 IQD",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: "SFPRO",
                                )),
                          ],
                        ),
                        SizedBox(height: h(8),),
                        Container(height: 1,width: w(350),color: Colors.grey[300],)
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: h(55),),
                Row(
              children: [
                SizedBox(
                  width: w(26),
                ),
                Text("  Paid     ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontFamily: "SFPRO",
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  width: w(230),
                ),
                SvgPicture.asset("assets/images/Ellipse 21.svg"),
              ],
            ),
             SizedBox(
              height: h(12),
            ),
            Container(
              height: 1,
              width: w(350),
              color: Colors.grey[300],
            ),
            SizedBox(
              height: h(14.5),
            ),
            Container(
               height: h(185),
                  width: size.width,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  
                  return Container(
                   
                    child: Column(
                      children: [
                        SizedBox(height: h(4),),
                        Row(
                          children: [
                            SizedBox(
                              width: w(29),
                            ),
                            Text("January 30, 2021",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: "SFPRO",
                                )),
                                   SizedBox(width: w(176.5),),
                                SvgPicture.asset("assets/images/Icon awesome-check.svg")
                          ],
                        ),
                        SizedBox(height: h(6),),
                        Row(
                          children: [
                            SizedBox(
                              width: w(29),
                            ),
                            Text("#1864",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: "SFPRO",
                                )),
                          ],
                        ),
                        SizedBox(height: h(6),),
                        Row(
                          children: [
                            SizedBox(
                              width: w(29),
                            ),
                            Text("Total",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: "SFPRO",
                                )),
                            SizedBox(
                              width: w(199),
                            ),
                            Text("50,250 IQD",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: "SFPRO",
                                )),
                          ],
                        ),
                        SizedBox(height: h(8),),
                        Container(height: 1,width: w(350),color: Colors.grey[300],)
                      ],
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
