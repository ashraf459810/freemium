import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:freemium/UI/Emergency/Emergency.dart';
import 'package:freemium/UI/PrivacyPolicy/PrivacyPolicy.dart';
import 'package:freemium/UI/Profile/Profile.dart';

class HomeDrawer extends StatefulWidget {
  HomeDrawer({Key key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
          elevation: 200,
          child: Container(
            color: Colors.white,
            child: ListView(
              children: [
                SizedBox(
                  height: h(30),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: w(10),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.close,
                          size: 40,
                          color: Colors.grey[400],
                        ),
                        onPressed: () => Navigator.of(context).pop()),
                  ],
                ),
                SizedBox(
                  height: h(50),
                ),
                Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      'Settings',
                      style: TextStyle(
                          color: AppColor.button,
                          fontSize: 20.sp,
                          fontFamily: 'SFPRO'),
                    ),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ),
                SizedBox(
                  height: h(20),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Profile(),
                    ));
                  },
                  child: Row(
                    children: [
                      SizedBox(width: w(20)),
                      SvgPicture.asset(
                        "assets/images/Icon material-person.svg",
                        height: 15,
                        width: 15,
                        color: AppColor.button,
                      ),
                      SizedBox(width: w(10)),
                      Text(
                        "profile",
                        style: TextStyle(
                            color: AppColor.homecard, fontSize: 20.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h(25),
                ),
                Row(
                  children: [
                    SizedBox(width: w(18)),
                    SvgPicture.asset(
                        "assets/images/Icon awesome-book-reader.svg"),
                    SizedBox(width: w(7)),
                    Text(
                      "Community Rules",
                      style: TextStyle(
                          color: AppColor.homecard,
                          fontSize: 20.sp,
                          fontFamily: 'SFPRO'),
                    ),
                  ],
                ),
                SizedBox(
                  height: h(25),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Emergency(),
                  )),
                  child: Row(
                    children: [
                      SizedBox(width: w(20)),
                      SvgPicture.asset(
                          "assets/images/Icon awesome-address-book.svg"),
                      SizedBox(width: w(10)),
                      Text(
                        "Emergency",
                        style: TextStyle(
                            color: AppColor.homecard,
                            fontSize: 20.sp,
                            fontFamily: 'SFPRO'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h(25),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PrivacyPolicy(),
                    ));
                  },
                  child: Row(
                    children: [
                      SizedBox(width: w(20)),
                      SvgPicture.asset(
                          "assets/images/Icon awesome-exclamation-circle.svg"),
                      SizedBox(width: w(10)),
                      Text(
                        "Privacy Policy",
                        style: TextStyle(
                            color: AppColor.homecard,
                            fontSize: 20.sp,
                            fontFamily: 'SFPRO'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h(25),
                ),
                Row(
                  children: [
                    SizedBox(width: w(20)),
                    SvgPicture.asset(
                        "assets/images/Icon material-language.svg"),
                    SizedBox(width: w(10)),
                    Text(
                      "Language",
                      style: TextStyle(
                          color: AppColor.homecard,
                          fontSize: 20.sp,
                          fontFamily: 'SFPRO'),
                    ),
                  ],
                ),
                SizedBox(
                  height: h(30),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: w(45),
                    ),
                    Text(
                      "About",
                      style: TextStyle(
                          color: AppColor.homecard,
                          fontSize: 20.sp,
                          fontFamily: 'SFPRO'),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
