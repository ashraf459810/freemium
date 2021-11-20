import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:freemium/UI/Address.dart/Address.dart';
import 'package:freemium/UI/Registeration/bloc/signup_bloc.dart';
import 'package:freemium/UI/Widgets/Widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({Key key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  ReusableWidgets reusableWidgets = ReusableWidgets();
  @override
  void initState() {
    super.initState();
  }

  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcntroller = TextEditingController();
  String email;
  String name;
  String password;
  String birthdate;
  String chosenGender = '0';
  String _date = "date";
  var items = ["Male", "Female"];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: reusableWidgets.appbar(context, "Create Account")),
      body: Container(
        width: ScreenUtil().setWidth(375),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: <Widget>[
                    SizedBox(height: ScreenUtil().setHeight(70)),
                    reusableWidgets.container(namecontroller, (value) {
                      name = value;
                    }, "Full Name", "name"),
                    SizedBox(height: ScreenUtil().setHeight(12)),
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(25.1),
                        ),
                        Text(
                          "Birthday",
                          style: TextStyle(
                            color: AppColor.hintcolor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(12)),
                    birhpicker(),
                    SizedBox(height: ScreenUtil().setHeight(12)),
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(25.1),
                        ),
                        Text(
                          "Gender",
                          style: TextStyle(
                            color: AppColor.hintcolor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(12)),
                    gender(),
                    SizedBox(height: ScreenUtil().setHeight(12)),
                    reusableWidgets.container(emailcntroller, (value) {
                      email = value;
                    }, "E-mail", "email"),
                    SizedBox(height: ScreenUtil().setHeight(12)),
                    reusableWidgets.container(passwordcontroller, (value) {
                      password = value;
                      print(password);
                    }, "Password", "password"),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(42)),
                Container(
                    height: ScreenUtil().setHeight(44),
                    width: ScreenUtil().setWidth(44),
                    child: reusableWidgets.dots(
                        Colors.grey[400], AppColor.button, Colors.grey[400])),
                SizedBox(
                  height: ScreenUtil().setHeight(13),
                ),
                GestureDetector(
                    onTap: () {
                      final result = _formKey.currentState.validate();
                      if (result) {
                        context.read<SignupBloc>().add(SaveSignUpInfoEvent(
                              name: name,
                              password: password,
                              email: email,
                              gender: chosenGender,
                              birhdate: birthdate,
                            ));
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Address(),
                        ));
                      }
                    },
                    child:
                        reusableWidgets.submitbutton("Next", AppColor.button)),
              ],
            ),
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
            birthdate = '${date.day}-${date.month}-${date.year}';
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
                width: ScreenUtil().setWidth(100),
                child: Text(
                  "  $_date",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0.sp,
                      fontFamily: "SFPRO"),
                ),
              ),
              SizedBox(
                  height: ScreenUtil().setHeight(20),
                  width: ScreenUtil().setWidth(20),
                  child: SvgPicture.asset(
                    "assets/images/Icon ionic-ios-arrow-back.svg",
                    fit: BoxFit.contain,
                  ))
            ],
          ),
        ),
      ),
    );
    // datetime()
  }

  Widget gender() {
    return Container(
      height: ScreenUtil().setHeight(47),
      width: ScreenUtil().setWidth(327),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColor.container,
      ),
      child: DropdownButton(
        underline: SizedBox(),
        icon: Row(
          children: [
            SizedBox(
              width: ScreenUtil().setWidth(221),
            ),
            SizedBox(
                height: ScreenUtil().setHeight(20),
                width: ScreenUtil().setWidth(20),
                child: SvgPicture.asset(
                  "assets/images/Icon ionic-ios-arrow-back.svg",
                  fit: BoxFit.contain,
                )),
          ],
        ),
        value: chosenGender == '0' ? items[0] : chosenGender,
        items: items.map((gender) {
          return DropdownMenuItem(
              value: gender,
              child: Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                  child: Container(
                    width: ScreenUtil().setWidth(52),
                    child: Text(
                      gender,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16.sp,
                          fontFamily: "SFPRO"),
                    ),
                  )));
        }).toList(),
        onChanged: (val) {
          setState(() {
            if (val == "Male") {
              chosenGender = "0";
            } else
              chosenGender = "1";
          });
        },
      ),
    );
  }
}
