import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:freemium/UI/Widgets/Widgets.dart';

class GuestRequest extends StatefulWidget {
  GuestRequest({Key key}) : super(key: key);

  @override
  _GuestRequestState createState() => _GuestRequestState();
}

class _GuestRequestState extends State<GuestRequest> {
  TimeOfDay picked;
  TextEditingController namec = TextEditingController();
  String name;
  bool box1 = true;
  bool box2 = false;
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
                height: h(32),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Guest Authorization Request",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: "SFPRO",
                        color: Colors.black87),
                  ),
                  SvgPicture.asset(
                    "assets/images/Icon awesome-user-friends.svg",
                    height: h(20),
                    width: w(20),
                  )
                ],
              ),
              SizedBox(
                height: h(37),
              ),
              Row(
                children: [
                  SizedBox(
                    width: w(35),
                  ),
                  Text(
                    "Number of Guests",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "SFPRO",
                        color: Colors.black87),
                  )
                ],
              ),
              SizedBox(
                height: h(14),
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
                      height: h(47),
                      width: w(131),
                      decoration: box1
                          ? BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    AppColor.gradient1,
                                    AppColor.gradient3,
                                    AppColor.gradient2
                                  ]))
                          : BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(color: AppColor.gradient1)),
                      child: Center(
                          child: Text("1 Person",
                              style: box1
                                  ? TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontFamily: "SFPRO")
                                  : TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16.sp,
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
                      height: h(47),
                      width: w(131),
                      decoration: box2
                          ? BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    AppColor.gradient1,
                                    AppColor.gradient3,
                                    AppColor.gradient2
                                  ]))
                          : BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(color: AppColor.gradient1)),
                      child: Center(
                          child: Text("Group",
                              style: box1
                                  ? TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16.sp,
                                      fontFamily: "SFPRO")
                                  : TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontFamily: "SFPRO"))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h(20),
              ),
              reusableWidgets.container(namec, (val) {
                name = val;
              }, "Guest Name", "name"),
              SizedBox(
                height: h(14),
              ),
              Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(25.1),
                  ),
                  Text(
                    "Date of Visit",
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
                height: h(14),
              ),
              Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(25.1),
                  ),
                  Text(
                    "Time of Visit",
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
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: "SFPRO"),
                              )
                            : Text(
                                "${picked.hourOfPeriod}:${picked.minute} ${picked.period.toString().substring(10)} ",
                              ))),
              ),
              SizedBox(
                height: h(140),
              ),
              InkWell(
                  onTap: () {
                    reusableWidgets.showAlertDialog(context);
                  },
                  child: reusableWidgets.submitbutton(
                      "Confirm Request", AppColor.button))
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: ScreenUtil().setWidth(100),
                child: Center(
                  child: Text(
                    "  $_date",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w100,
                      fontFamily: "SFPRO",
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //     height: ScreenUtil().setHeight(20),
              //     width: ScreenUtil().setWidth(20),
              //     child: SvgPicture.asset(
              //       "assets/images/Icon ionic-ios-arrow-back.svg",
              //       fit: BoxFit.contain,
              //     ))
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
