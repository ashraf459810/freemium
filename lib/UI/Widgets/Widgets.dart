import 'dart:ui';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:regexpattern/regexpattern.dart';

class ReusableWidgets {
  //  final bool isValid = EmailValidator.validate(emailvalidator);
  Widget container(TextEditingController editingController, Function f,
      String label, String type,
      [double height]) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: ScreenUtil().setWidth(25.1),
            ),
            Text(
              label,
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
          height: height == null ? ScreenUtil().setHeight(47) : height,
          width: ScreenUtil().setWidth(327),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AppColor.container,
          ),
          child: TextFormField(
            validator: type == "name"
                ? (value) => value.isEmpty
                    ? 'Enter Your Name'
                    : !RegexValidation.hasMatch(
                            value, RegexPattern.alphabetOnly)
                        ? "Enter a valid name"
                        : null
                : type == "email"
                    ? (value) {
                        if (value.isEmpty) {
                          return 'Enter Your Email';
                        }

                        bool emailValid = EmailValidator.validate(value);
                        print(emailValid);
                        if (emailValid == true) {
                          return null;
                        } else {
                          return "Enter a valid email";
                        }
                      }
                    : type == "password"
                        ? (value) {
                            if (value.isEmpty) {
                              return "enter your password";
                            }
                            String pattern =
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
                            RegExp regExp = new RegExp(pattern);
                            bool validpassword = regExp.hasMatch(value);
                            if (validpassword == true) {
                              return null;
                            } else {
                              return "passwrod lenght 8 contains numbers capital and small letters";
                            }
                          }
                        : null,
            keyboardType: type == "name"
                ? TextInputType.name
                : type == "password"
                    ? TextInputType.visiblePassword
                    : type == "number"
                        ? TextInputType.number
                        : TextInputType.emailAddress,
            controller: editingController,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: ScreenUtil().setWidth(20), bottom: 7),
              border: InputBorder.none,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
            onChanged: (value) {
              f(value);
            },
          ),
        ),
      ],
    );
  }

  Widget dots(Color color1, Color color2, Color color3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: ScreenUtil().setHeight(10),
          width: ScreenUtil().setWidth(8.5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: color1),
        ),
        Container(
          height: ScreenUtil().setHeight(10),
          width: ScreenUtil().setWidth(8.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: color2,
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(10),
          width: ScreenUtil().setWidth(8.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: color3,
          ),
        ),
      ],
    );
  }

  Widget submitbutton(String title, Color color) {
    return Container(
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 20.sp, fontFamily: 'SFPRO'),
        ),
      ),
      height: ScreenUtil().setHeight(47),
      width: ScreenUtil().setWidth(327),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );
  }

  Widget appbar(context, String title) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
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
        title,
        style: TextStyle(
            color: AppColor.register,
            fontSize: 20.sp,
            fontFamily: 'SFPRO',
            fontWeight: FontWeight.normal),
      ),

      // ...
    );
  }

  Widget serviceintro(String text1, String text2, String text3, String text4,
      String text5, String icon) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: w(12),
            ),
            Text(
              text1,
              style: TextStyle(
                  color: Colors.black87, fontFamily: "SFPRO", fontSize: 20.sp),
            ),
            SizedBox(
              width: w(185),
            ),
            SvgPicture.asset(
              "$icon",
              height: h(24),
              width: w(25),
            ),
          ],
        ),
        SizedBox(
          height: h(6),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: w(12),
            ),
            Text(
              text2,
              style: TextStyle(
                  color: Colors.black87, fontFamily: "SFPRO", fontSize: 14.sp),
            ),
          ],
        ),
        SizedBox(
          height: h(3),
        ),
        Row(
          children: [
            SizedBox(
              width: w(12),
            ),
            Text(
              text3,
              style: TextStyle(
                  color: Colors.black87, fontFamily: "SFPRO", fontSize: 14.sp),
            ),
          ],
        ),
        SizedBox(
          height: h(15),
        ),
        Row(
          children: [
            SizedBox(
              width: w(12),
            ),
            Text(
              text4,
              style: TextStyle(
                  color: Colors.black87, fontFamily: "SFPRO", fontSize: 14.sp),
            )
          ],
        ),
        SizedBox(
          height: h(3),
        ),
        Row(
          children: [
            SizedBox(
              width: w(12),
            ),
            Text(
              text5,
              style: TextStyle(
                  color: Colors.black87, fontFamily: "SFPRO", fontSize: 14.sp),
            )
          ],
        ),
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button

    // set up the AlertDialog

    AlertDialog alert = AlertDialog(
      actionsPadding: EdgeInsets.all(0),
      buttonPadding: EdgeInsets.all(0),
      // insetPadding: EdgeInsets.all(30),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Container(
        color: Colors.white.withOpacity(0),
        height: ScreenUtil().setHeight(260),
        width: ScreenUtil().setWidth(307),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(3),
            ),
            SvgPicture.asset(
              "assets/images/confirmIcon.svg",
              height: h(163),
              width: w(170),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(7.5),
            ),
            Container(
              child: Text(
                "Thank You!",
                style: TextStyle(
                    color: Colors.black87, fontSize: 30, fontFamily: "SFPRO"),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(1),
            ),
            Container(
              child: Text(
                "Your message has been sent!",
                style: TextStyle(
                    color: Colors.black87, fontSize: 18, fontFamily: "SFPRO"),
              ),
            ),
          ],
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: w(350),
            height: h(50),
            decoration: BoxDecoration(
                color: AppColor.button,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
                child: Text(
              "Return",
              style: TextStyle(color: Colors.black87, fontSize: 20.sp),
            )),
          ),
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return
            // Container(
            //   decoration: BoxDecoration(
            //         image: DecorationImage(
            //           image: AssetImage("assets/images/blurforalert.png"),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //   child:
            new BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 10, sigmaY: 10, tileMode: TileMode.clamp),
                child: alert);
        // );
      },
    );
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
