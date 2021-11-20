import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemium/UI/Registeration/bloc/signup_bloc.dart';
import 'package:freemium/UI/VerificationCode/VerificationCode.dart';
import 'package:freemium/Core/Consts.dart';

import 'package:toast/toast.dart';
import 'package:freemium/UI/Widgets/Widgets.dart';

class Registeration extends StatefulWidget {
  Registeration({Key key}) : super(key: key);

  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  ReusableWidgets reusableWidgets = ReusableWidgets();
  bool correctnumber = false;
  TextEditingController numbercontroller = TextEditingController();
  String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: AppBar(
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
            "Registeration",
            style: TextStyle(color: AppColor.register, fontSize: 20.sp),
          ),

          // ...
        ),
      ),
      body: Container(
        width: ScreenUtil().setWidth(375),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(30.6),
              ),
              Container(
                  height: ScreenUtil().setHeight(191.93),
                  width: ScreenUtil().setWidth(246.47),
                  child: SvgPicture.asset(
                    "assets/images/Group 2.svg",
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                height: ScreenUtil().setHeight(97),
              ),
              Text(
                "Enter your phone number to verify",
                style: TextStyle(
                    color: AppColor.register,
                    fontSize: 16.sp,
                    fontFamily: 'SFPRO'),
              ),
              Text(
                "your account",
                style: TextStyle(
                    color: AppColor.register,
                    fontSize: 16.sp,
                    fontFamily: 'SFPRO'),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(23),
              ),
              Container(
                height: ScreenUtil().setHeight(47),
                width: ScreenUtil().setWidth(292),
                decoration: BoxDecoration(
                  color: AppColor.container,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: ScreenUtil().setWidth(17),
                    ),
                    Text(
                      "+964",
                      style: TextStyle(color: Colors.black87),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(7.5),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(1),
                      height: ScreenUtil().setHeight(33),
                      color: Colors.black54,
                    ),
                    Container(
                        width: ScreenUtil().setWidth(150),
                        height: ScreenUtil().setHeight(15),
                        child: TextFormField(
                            maxLines: 1,
                            expands: false,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            controller: numbercontroller,
                            decoration: InputDecoration(
                                hintText: "Enter Your number",
                                hintStyle: TextStyle(fontSize: 15.sp),
                                contentPadding: EdgeInsets.all(9),
                                border: InputBorder.none),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              // correctnumber = false;
                              phone = value;

                              // if (phone.length == 10) {
                              //   if (phone.startsWith("0")) {
                              //     correctnumber = false;
                              //     setState(() {});
                              //   } else {
                              //     if (phone.startsWith("7")) correctnumber = true;
                              //     setState(() {});
                              //   }
                              correctnumber = true;
                            }

                            //   setState(() {});
                            // },
                            )),
                    SizedBox(
                      width: ScreenUtil().setWidth(50),
                    ),
                    correctnumber
                        ? Container(
                            height: ScreenUtil().setHeight(30),
                            width: ScreenUtil().setWidth(20),
                            child: SvgPicture.asset(
                                "assets/images/Icon awesome-check-circle.svg"))
                        : Container()
                  ],
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(146),
              ),
              Container(
                  height: ScreenUtil().setHeight(44),
                  width: ScreenUtil().setWidth(44),
                  child: reusableWidgets.dots(
                      AppColor.button, Colors.grey[400], Colors.grey[400])),
              SizedBox(
                height: ScreenUtil().setHeight(13),
              ),
              GestureDetector(
                onTap: () {
                  showAlertDialog(context);
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontFamily: 'SFPRO'),
                    ),
                  ),
                  height: ScreenUtil().setHeight(47),
                  width: ScreenUtil().setWidth(327),
                  decoration: BoxDecoration(
                    color: AppColor.button,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button

    // set up the AlertDialog

    AlertDialog alert = AlertDialog(
      actionsPadding: EdgeInsets.all(0),
      buttonPadding: EdgeInsets.all(0),
      // insetPadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Text("Are you sure this is your number",
          style: TextStyle(color: Colors.black87, fontSize: 16)),
      content: Container(
        color: AppColor.container,
        height: ScreenUtil().setHeight(47),
        width: ScreenUtil().setWidth(300),
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: ScreenUtil().setWidth(17),
              ),
              Text(
                "+964",
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(7.5),
              ),
              Container(
                width: ScreenUtil().setWidth(1),
                height: ScreenUtil().setHeight(33),
                color: Colors.black54,
              ),
              SizedBox(
                width: ScreenUtil().setWidth(7.5),
              ),
              Text(numbercontroller.text)
            ],
          ),
        ),
      ),
      actions: [
        BlocConsumer<SignupBloc, SignupState>(listener: (context, state) {
          if (state is SendCodeState) {
            Toast.show("your code send successfully", context,
                gravity: 100, duration: 2, backgroundColor: AppColor.gradient2);
            context.read<SignupBloc>().add(SaveSignUpNumberEvent(phone));
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VerificationScreen(
                number: phone,
              ),
            ));
          }
          if (state is GetError) {
            Toast.show(state.error, context,
                duration: 2, backgroundColor: AppColor.gradient2, gravity: 100);
          }
        }, builder: (context, state) {
          if (state is GetLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return InkWell(
            onTap: () {
              if (correctnumber == true) {
                context.read<SignupBloc>().add(SendCodeEvent(phone));
              } else {
                Navigator.of(context).pop();
                showToast("please enter a valid number starting with 75",
                    gravity: 100, duration: 2);
              }
            },
            child: Container(
              width: w(350),
              height: h(50),
              color: AppColor.button,
              child: Center(
                  child: Text(
                "Confirm",
                style: TextStyle(color: Colors.black87, fontSize: 20.sp),
              )),
            ),
          );
        }),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), child: alert);
      },
    );
  }

  showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context,
        duration: duration,
        gravity: gravity,
        backgroundColor: AppColor.container,
        textColor: Colors.black);
  }

  double h(double h) {
    return ScreenUtil().setHeight(h);
  }

  double w(double w) {
    return ScreenUtil().setWidth(w);
  }
}
