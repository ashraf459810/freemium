import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freemium/Core/Consts.dart';
import 'package:freemium/UI/Widgets/Widgets.dart';

class ElectricianRequest extends StatefulWidget {
  ElectricianRequest({Key key}) : super(key: key);

  @override
  _ElectricianRequestState createState() => _ElectricianRequestState();
}

class _ElectricianRequestState extends State<ElectricianRequest> {
  TimeOfDay picked;
  String _date = "setDate";
  ReusableWidgets reusableWidgets = ReusableWidgets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableWidgets.appbar(context, "Request"),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: Colors.grey[200],
                height: 1,
              ),
              SizedBox(
                height: h(26.5),
              ),
              reusableWidgets.serviceintro(
                  "Electrician                  ",
                  "This service will provide you with a professional electrician",
                  "that will help you fix your issues",
                  "Days available: Sun - Thu.",
                  "Times available: 10:00 AM - 5:00 PM ",
                  "assets/images/Icon map-electrician.svg"),
              SizedBox(
                height: h(10),
              ),
              Container(
                color: Colors.grey[200],
                height: 1,
                width: (w(400)),
              ),
              SizedBox(
                height: h(20),
              ),
              SizedBox(
                height: h(21),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [],
              ),
              SizedBox(
                height: h(5),
              ),
              Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(25.1),
                  ),
                  Text(
                    "Date",
                    style: TextStyle(
                      color: AppColor.hintcolor,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h(14),
              ),
              birhpicker(),
              SizedBox(
                height: h(20),
              ),
              Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(25.1),
                  ),
                  Text(
                    "Time",
                    style: TextStyle(
                      color: AppColor.hintcolor,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h(14),
              ),
              Container(
                height: ScreenUtil().setHeight(47),
                width: ScreenUtil().setWidth(327),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColor.container,
                ),
                child: GestureDetector(
                    onTap: () async {
                      picked = await showTimePicker(
                        initialEntryMode: TimePickerEntryMode.input,
                        cancelText: "cancel",
                        context: context,
                        initialTime: TimeOfDay.now(),
                        builder: (BuildContext context, Widget child) {
                          return MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(alwaysUse24HourFormat: false),
                            child: child,
                          );
                        },
                      );
                      setState(() {});
                    },
                    child: Center(
                        child: picked == null
                            ? Text(
                                "SetTime",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0.sp,
                                    fontFamily: "SFPRO"),
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                "${picked.hourOfPeriod} :${picked.minute} ${picked.period.toString().substring(10)} ",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0.sp,
                                    fontFamily: "SFPRO"),
                              ))),
              ),
              SizedBox(
                height: h(38),
              ),
              Row(
                children: [
                  SizedBox(
                    width: w(12),
                  ),
                  Text(
                    "Request Details",
                    style: TextStyle(fontSize: 16.sp, fontFamily: "SFPRO"),
                  )
                ],
              ),
              SizedBox(
                height: h(9),
              ),
              Row(
                children: [
                  SizedBox(
                    width: w(12),
                  ),
                  Text(
                    "3 hours - 29/Dec/2020 - 2:15 PM",
                    style: TextStyle(fontSize: 16.sp, fontFamily: "SFPRO"),
                  ),
                ],
              ),
              SizedBox(
                height: 14.5,
              ),
              Container(
                color: Colors.grey[200],
                height: 1,
              ),
              SizedBox(
                height: 14.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: w(12),
                  ),
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 16.sp, fontFamily: "SFPRO"),
                  ),
                  SizedBox(
                    width: w(230),
                  ),
                  Text(
                    "50,000 IQD",
                    style: TextStyle(fontSize: 16.sp, fontFamily: "SFPRO"),
                  )
                ],
              ),
              SizedBox(
                height: h(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: w(12),
                  ),
                  Text(
                    "*Extra fees may apply",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "SFPRO",
                        color: Colors.red[600]),
                  ),
                ],
              ),
              SizedBox(
                height: h(60),
              ),
              InkWell(
                  onTap: () {
                    reusableWidgets.showAlertDialog(context);
                  },
                  child: InkWell(
                    onTap: () {
                      reusableWidgets.showAlertDialog(context);
                    },
                    child: reusableWidgets.submitbutton(
                        "Confirm Request", AppColor.button),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget birhpicker() {
    return SizedBox(
      height: ScreenUtil().setHeight(47),
      width: ScreenUtil().setWidth(327),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          foregroundColor: MaterialStateProperty.all<Color>(AppColor.container),
          backgroundColor: MaterialStateProperty.all<Color>(AppColor.container),
        ),
        onPressed: () {
          DatePicker.showDatePicker(context,
              theme: DatePickerTheme(
                doneStyle:
                    TextStyle(color: Colors.orange[900], fontSize: 20.sp),
                cancelStyle:
                    TextStyle(color: Colors.orange[900], fontSize: 20.sp),
                backgroundColor: AppColor.container,
                containerHeight: ScreenUtil().setHeight(200),
              ),
              showTitleActions: true,
              minTime: DateTime(1900, 1, 1),
              maxTime: DateTime.now(), onConfirm: (date) {
            print('confirm $date');
            _date = '${date.day}/${date.month}/${date.year}';
            setState(() {});
          }, currentTime: DateTime.now(), locale: LocaleType.en);
        },
        child: Container(
          alignment: Alignment.center,
          height: ScreenUtil().setHeight(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: ScreenUtil().setWidth(287),
                child: Center(
                  child: Text(
                    "  $_date",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.0.sp,
                        fontFamily: "SFPRO",
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // datetime()
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
