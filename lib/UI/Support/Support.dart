import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:freemium/UI/Support/bloc/support_bloc.dart';

import 'package:url_launcher/url_launcher.dart';

class Support extends StatefulWidget {
  Support({Key key}) : super(key: key);

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  SupportBloc supportBloc = SupportBloc();
  @override
  void initState() {
    supportBloc.add(AddContacstSupport());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Support",
          style: TextStyle(
              color: AppColor.register, fontSize: 20.sp, fontFamily: 'SFPRO'),
        ),
        actions: [
          SvgPicture.asset("assets/images/Icon ionic-ios-chatboxes.svg"),
          SizedBox(
            width: w(10),
          ),
        ],

        // ...
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: h(20)),
            supportrow(
                "assets/images/Icon material-person.svg",
                "Management     ",
                "assets/images/call.svg",
                "assets/images/Icon material-chat.svg",
                context,1),
            // SizedBox(height: h(10.5),),
            InkWell(
                onTap: () {
                  // launch("tel://7507611798");
                },
                child: supportrow(
                    "assets/images/Icon awesome-toolbox.svg",
                    "Service Provider",
                    "assets/images/call.svg",
                    "assets/images/Icon material-chat.svg",
                    context,2)),
            //  SizedBox(height: h(10.5),),
            InkWell(
                onTap: () {
                  // launch("tel://7507611792");
                },
                child: supportrow(
                    "assets/images/Icon material-security.svg",
                    "Security                ",
                    "assets/images/call.svg",
                    "assets/images/Icon material-chat.svg",
                    context,3)),

            SizedBox(
              height: h(90.5),
            ),
            Row(
              children: [
                SizedBox(
                  width: w(25),
                ),
                Text(
                  "FAQ",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black87,
                      fontFamily: "SFPRO"),
                ),
                SizedBox(
                  width: w(260),
                ),
                Text(
                  "ViewAll",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.orange[700],
                      fontFamily: "SFPRO"),
                ),
              ],
            ),

            SizedBox(
              height: h(10),
            ),

            Container(
              height: h(200),
              width: w(330),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300].withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 6,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: (3),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                        child: Container(
                          height: h(44),
                          width: w(330),
                          child: Column(
                            children: [
                              SizedBox(
                                height: h(3),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: w(10),
                                  ),
                                  Text(
                                    "How to pay electricity bill?",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'SFPRO',
                                        color: AppColor.homecard),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h(10),
                              ),
                              Container(
                                height: 1,
                                width: w(320),
                                color: Colors.grey[200],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget supportrow(String image1, String text, String image2, String image3,
    context, int number) {
  return Column(
    children: [
      // SizedBox(height: h(49),),
      Row(
        children: [
          SizedBox(
            width: w(27),
          ),
          SvgPicture.asset(
            image1,
            height: h(25),
            width: w(25),
            color: Colors.orange[700],
          ),
          SizedBox(
            width: w(18),
          ),
          Text(text,
              style: TextStyle(
                  color: Colors.black87, fontSize: 20.sp, fontFamily: "SFPRO")),
          SizedBox(
            width: w(50),
          ),
          InkWell(
              onTap: () {
                switch (number) {
                  case 1:
                    launch("tel://7507611792");
                    break;
                  case 2:
                    launch("tel://750761179");
                    break;
                  case 3:
                    launch("tel://75076117984");
                    break;
                }
              },
              child: SvgPicture.asset(image2)),
          SizedBox(
            width: w(15),
          ),
          InkWell(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => Chat(),
              // ));
            },
            child: Column(
              children: [
                SvgPicture.asset(image3),
                Text("Free Chat",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.sp,
                        fontFamily: "SFPRO")),
              ],
            ),
          ),
        ],
      ),
      SizedBox(
        height: h(20.5),
      ),
      Container(
        height: 1,
        width: w(350),
        color: Colors.grey[200],
      )
    ],
  );
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
