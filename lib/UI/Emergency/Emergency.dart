import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freemium/Core/Consts.dart';

import 'package:freemium/UI/Support/bloc/support_bloc.dart';

import 'package:url_launcher/url_launcher.dart';

class Emergency extends StatefulWidget {
  Emergency({Key key}) : super(key: key);

  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  SupportBloc supportBloc = SupportBloc();
  @override
  void initState() {
    supportBloc.add(AddContacstEmergency());

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
          "Emergency ",
          style: TextStyle(
              color: AppColor.register, fontSize: 20.sp, fontFamily: 'SFPRO'),
        ),

        // ...
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: h(20)),
            supportrow(
                "assets/images/Icon map-police.svg",
                "   Police                     ",
                "assets/images/call.svg",
                "assets/images/Icon material-chat.svg",
                context,1),
            // SizedBox(height: h(10.5),),
            InkWell(
                onTap: () {
                  // launch("tel://7507611798");
                },
                child: supportrow(
                    "assets/images/Icon awesome-ambulance.svg",
                    "Ambulance           ",
                    "assets/images/call.svg",
                    "assets/images/Icon material-chat.svg",
                    context,2)),
            //  SizedBox(height: h(10.5),),
            InkWell(
                onTap: () {
                  launch("tel://7507611798");
                },
                child: supportrow(
                    "assets/images/Icon material-security.svg",
                    "Firefighter               ",
                    "assets/images/call.svg",
                    "assets/images/Icon material-chat.svg",
                    context,3)),

            SizedBox(
              height: h(90.5),
            ),

            SizedBox(
              height: h(10),
            ),

            Container(
                height: h(47),
                width: w(327),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300].withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 6,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: InkWell(
                    onTap: () async {
                      openContactForm();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/Icon awesome-address-book.svg",
                          color: Colors.orange[700],
                          height: h(26),
                          width: w(24),
                        ),
                        SizedBox(
                          width: w(20),
                        ),
                        Text(
                          "Add a contact",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: "SFPRO",
                              color: Colors.orange[700]),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

Widget supportrow(
    String image1, String text, String image2, String image3, context,int number) {
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
            height: h(30),
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
            width: w(30),
          ),
          InkWell(onTap: (){

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
          }},
            child: SvgPicture.asset(image2)),
          SizedBox(
            width: w(15),
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

openContactForm() async {
  try {
    var contact = await ContactsService.openContactForm();
    print(contact);
  } on FormOperationException catch (e) {
    switch (e.errorCode) {
      case FormOperationErrorCode.FORM_OPERATION_CANCELED:
      case FormOperationErrorCode.FORM_COULD_NOT_BE_OPEN:
      case FormOperationErrorCode.FORM_OPERATION_UNKNOWN_ERROR:
      default:
        print(e.errorCode);
    }
  }
}
