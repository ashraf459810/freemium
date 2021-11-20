import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemium/Core/Consts.dart';

import 'package:freemium/UI/Home/Home.dart';
import 'package:freemium/UI/Registeration/Registeration.dart';
import 'package:regexpattern/regexpattern.dart';

import 'bloc/login_bloc.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String userormobile;
  String password;
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                  AppColor.gradient1,
                  AppColor.gradient3,
                  AppColor.gradient2
                ])),
            child: Stack(
              children: [
                Positioned(
                  left: ScreenUtil().setWidth(105),
                  right: ScreenUtil().setWidth(105.3),
                  top: ScreenUtil().setHeight(64.4),
                  bottom: ScreenUtil().setHeight(570.6),
                  child: SizedBox(
                      width: ScreenUtil().setWidth(164.71),
                      height: ScreenUtil().setHeight(176.9),
                      child: SvgPicture.asset(
                        "assets/images/Component 9 – 1.svg",
                        fit: BoxFit.contain,
                      )),
                ),
                Positioned(
                    top: ScreenUtil().setHeight(290),
                    bottom: ScreenUtil().setHeight(473),
                    left: ScreenUtil().setWidth(102),
                    right: ScreenUtil().setWidth(102),
                    child: Container(
                      height: ScreenUtil().setHeight(49),
                      width: ScreenUtil().setHeight(171),
                      child: Text(
                        "Freemium",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 41.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SFPRO'),
                      ),
                    )),
                Positioned(
                    top: ScreenUtil().setHeight(387),
                    left: ScreenUtil().setWidth(24),
                    right: ScreenUtil().setWidth(162),
                    bottom: ScreenUtil().setHeight(406),
                    child: Container(
                      height: ScreenUtil().setHeight(19),
                      width: ScreenUtil().setWidth(189),
                      child: Text(
                        "Username or mobile number",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'SFPRO',
                            fontWeight: FontWeight.normal),
                      ),
                    )),
                Positioned(
                    left: ScreenUtil().setWidth(24),
                    right: ScreenUtil().setWidth(24),
                    top: ScreenUtil().setHeight(418),
                    bottom: ScreenUtil().setHeight(347),
                    child: Container(
                      height: ScreenUtil().setHeight(47),
                      width: ScreenUtil().setWidth(327),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Form(
                          key: _formKey2,
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "enter your name or number";
                              }

                              bool isvalidname = RegexValidation.hasMatch(
                                  value, RegexPattern.alphabetOnly);
                              bool isvalidnumber = RegexValidation.hasMatch(
                                  value, RegexPattern.numericOnly);
                              //  ||       RegExp(r'[!@#<>?":_`~;[\]\|=+)(*&^%0-9-]')
                              //     .hasMatch(value)  ;

                              if (isvalidname || isvalidnumber) {
                                return null;
                              } else {
                                return "please enter a valid name or number ";
                              }
                            },
                            cursorColor: Colors.orange,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10)),
                            controller: controller,
                            onChanged: (value) {
                              userormobile = value;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    top: ScreenUtil().setHeight(482),
                    left: ScreenUtil().setWidth(24),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'SFPRO',
                      ),
                    )),
                Positioned(
                    top: ScreenUtil().setHeight(513),
                    left: ScreenUtil().setWidth(24),
                    child: Container(
                      height: ScreenUtil().setHeight(47),
                      width: ScreenUtil().setWidth(327),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            validator: (value) {
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
                            },
                            cursorColor: Colors.orange,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10)),
                            controller: controller2,
                            onChanged: (value) {
                              password = value;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    top: ScreenUtil().setHeight(572),
                    left: ScreenUtil().setWidth(255),
                    child: Text("Forgot Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'SFPRO'))),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginState) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                  },
                  builder: (context, state) {
                    if (state is GetLoadingLogin) {
                      return Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      ));
                    }
                    if (state is GetErrorLogin) {
                      return Center(
                        child: Text(state.error),
                      );
                    }
                    return Positioned(
                      top: ScreenUtil().setHeight(636),
                      left: ScreenUtil().setWidth(24),
                      child: InkWell(
                        onTap: () {
                          final result = _formKey.currentState.validate();
                          final result2 = _formKey2.currentState.validate();
                          // if (result && result2) {
                          context
                              .read<LoginBloc>()
                              .add(GetLoginEvent(userormobile, password));
                          // }
                        },
                        child: Center(
                          child: Container(
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: 20.sp,
                                    fontFamily: 'SFPRO'),
                              ),
                            ),
                            height: ScreenUtil().setHeight(47),
                            width: ScreenUtil().setWidth(327),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  top: ScreenUtil().setHeight(720),
                  left: ScreenUtil().setWidth(133),
                  right: ScreenUtil().setWidth(125),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Registeration(),
                      ));
                    },
                    child: Text("Create Account",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: 'SFPRO')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
