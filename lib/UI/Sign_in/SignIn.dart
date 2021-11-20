import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:freemium/Core/Consts.dart';

import 'package:freemium/UI/Login/Login.dart';
import 'package:freemium/UI/Registeration/Registeration.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: h(180),),
           
               SizedBox(
                  height: ScreenUtil().setHeight(176.9),
                  width: ScreenUtil().setWidth(164.71),
                  child: SvgPicture.asset(
                    "assets/images/Component 9 – 1.svg",
                    fit: BoxFit.contain,
                  )),
                  SizedBox(height: h(48.6),),
            
    
                 Row(mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                
                      // height: ScreenUtil().setHeight(49),
                      // width: ScreenUtil().setWidth(170),
                      child: Text(
                     'Freemium',
                      
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 41.sp,
                          fontWeight: FontWeight.bold,fontFamily: 'SFPRO'
                        ),
                      ),
                ),
                   ],
                 ),
                 SizedBox(height: h(190.6),),
         
               InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Registeration(),
                  ));
                },
                child: Center(
                  child: Container(
                    child: Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 20.sp,
                          fontFamily: 'SFPRO',fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                    height: ScreenUtil().setHeight(47.0),
                    width: ScreenUtil().setWidth(327.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: h(44),),
            
           
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Login(),
                  ));
                },
                child: SizedBox(
                  child: Text("Login to Account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,fontFamily: 'SFPRO',fontWeight: FontWeight.normal
                      )),
                ),
              ),
            
            // Positioned(
            //   top: ScreenUtil().setHeight(799),
            //   left: ScreenUtil().setWidth(120),
            //    right: ScreenUtil().setWidth(120),

            //   child: Container(
            //     height: ScreenUtil().setHeight(5),
            //     width:  ScreenUtil().setWidth(135),
            //     decoration: BoxDecoration(color: Colors.black),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
    double h(double h) {
    return ScreenUtil().setHeight(h);
  }

  double w(double w) {
    return ScreenUtil().setWidth(w);
  }
}
