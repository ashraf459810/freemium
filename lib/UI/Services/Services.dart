import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemium/ui/RequestHistory/RequestHistory.dart';
import 'package:freemium/UI/CleanRequest/CleanRequest.dart';
import 'package:freemium/UI/ElectricianRequest/ElectricianRequest.dart';
import 'package:freemium/UI/GuestRequest/GuestRequest.dart';
import 'package:freemium/UI/Widgets/Widgets.dart';

class Services extends StatefulWidget {
  Services({Key key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  ReusableWidgets reusableWidgets = ReusableWidgets();
  TextEditingController searchc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: reusableWidgets.appbar(context, "Services"),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: Container(
                height: h(31),
                width: w(340),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.grey[200]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: w(13),
                    ),
                    SvgPicture.asset("assets/images/Icon ionic-ios-search.svg"),
                    SizedBox(
                      width: w(13),
                    ),
                    SizedBox(
                      width: w(200),
                      height: h(20),
                      child: TextFormField(
                          controller: searchc,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 1),
                            border: InputBorder.none,
                            hintText: "Search",
                            isDense: true,
                            hintStyle: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 16.sp,
                                fontFamily: 'SFPRO'),
                          )),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h(28),
            ),
            Container(
              height: h(68),
              width: w(336),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey[300].withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 6,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ], color: Colors.white),
              child: InkWell(onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestHistory(),)),
                              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset("assets/images/Icon ionic-ios-paper.svg"),
                    Text(
                      "Request History",
                      style: TextStyle(fontSize: 20.sp, color: Colors.black87),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h(30),
            ),
            Container(
                child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: w(20),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GuestRequest(),
                          ));
                        },
                        child: serviceCard(
                            "assets/images/Icon awesome-user-friends.svg",
                            "       Guest\nAuthorization")),
                    SizedBox(
                      width: w(15),
                    ),
                    serviceCard("assets/images/Icon awesome-taxi.svg",
                        "Request\n   Taxt"),
                    SizedBox(
                      width: w(15),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CleanRequest(),
                          ));
                        },
                        child: serviceCard(
                            "assets/images/Path 29.svg", "Cleaning")),
                  ],
                ),
                SizedBox(
                  height: h(20),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: w(20),
                    ),
                    serviceCard("assets/images/Path 26.svg", "Dry Cleaning"),
                    SizedBox(
                      width: w(15),
                    ),
                    serviceCard(
                        "assets/images/Icon ionic-ios-water.svg", "Water"),
                    SizedBox(
                      width: w(15),
                    ),
                    serviceCard("assets/images/Group 10.svg", "Fixing"),
                  ],
                ),
                SizedBox(
                  height: (20),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ElectricianRequest(),
                    ));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: w(20),
                      ),
                      serviceCard("assets/images/Icon map-electrician.svg",
                          "Electrician"),
                      SizedBox(
                        width: w(15),
                      ),
                      serviceCard("assets/images/Path 28.svg", "Plumper"),
                      SizedBox(
                        width: w(15),
                      ),
                      serviceCard(
                          "assets/images/Icon awesome-dog.svg", "Dog Walk"),
                    ],
                  ),
                ),
                SizedBox(
                  height: (20),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: w(20),
                    ),
                    serviceCard("assets/images/Path 30.svg", "Carpet Cleaning"),
                    SizedBox(
                      width: w(15),
                    ),
                    serviceCard("assets/images/Group 11.svg", "Gas"),
                    SizedBox(
                      width: w(15),
                    ),
                    serviceCard(
                        "assets/images/Icon awesome-tree.svg", "Plant Care"),
                  ],
                ),
              ],
            ))
          ]),
        ),
      ),
    );
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}

Widget serviceCard(String image, String service) {
  return Container(
    height: h(106),
    width: w(102),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey[300].withOpacity(0.5),
        spreadRadius: 4,
        blurRadius: 6,
        offset: Offset(0, 1), // changes position of shadow
      ),
    ], color: Colors.white),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(image),
        Text(
          service,
          style: TextStyle(
              fontSize: 16.sp, color: Colors.black87, fontFamily: 'SFPRO'),
        )
      ],
    ),
  );
}
