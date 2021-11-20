import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:freemium/UI/Lost&found/Lost&found.dart';
import 'package:freemium/UI/Home/bloc/home_bloc.dart';

import 'package:freemium/UI/HomeAppBar/Appbar.dart';
import 'package:freemium/UI/HomeDrawer/Drawer.dart';
import 'package:freemium/UI/NotificationsDrawer/NotificationsDrawer.dart';
import 'package:freemium/UI/Payment/Payment.dart';
import 'package:freemium/UI/Services/Services.dart';
import 'package:freemium/UI/Support/Support.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // homeBloc.add(AuthEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(
          child: NotificationsDrawer(),
        ),
        drawer: Drawer(
          child: HomeDrawer(),
        ),
        drawerScrimColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(h(60)),
          child: HomeAppBar(),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.white,
                    height: h(90),
                    width: w(90),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://content.fortune.com/wp-content/uploads/2018/07/gettyimages-961697338.jpg?resize=1000,666'),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "welcome Mark",
                        style: TextStyle(fontSize: 20.sp, fontFamily: 'SFPRO'),
                      ),
                      SizedBox(
                        height: h(8),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColor.button,
                          ),
                          Text(
                            "MRF 4 Towers,Floor 15,apt 60",
                            style:
                                TextStyle(fontSize: 12.sp, fontFamily: 'SFPRO'),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Services(),
                      ));
                    },
                    child: homeCard(
                        "assets/images/Icon awesome-tools.svg", "Services"),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Support(),
                      ));
                    },
                    child: homeCard(
                        "assets/images/Icon awesome-headset.svg", "Support"),
                  ),
                ],
              ),
              SizedBox(height: h(34)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => (Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Payment(),
                    ))),
                    child: homeCard("assets/images/Icon material-receipt.svg",
                        "Bills & Payments"),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LostFound(),
                    )),
                    child: homeCard(
                        "assets/images/Icon awesome-search-location.svg",
                        "Lost & Founds"),
                  ),
                ],
              ),
              SizedBox(height: h(40)),
              Row(
                children: [
                  SizedBox(
                    width: w(25),
                  ),
                  Text(
                    "Announcements",
                    style: TextStyle(
                        color: AppColor.homecard,
                        fontSize: 16.sp,
                        fontFamily: 'SFPRO'),
                  ),
                  SizedBox(
                    width: w(175),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 12.sp,
                        fontFamily: 'SFPRO',
                        color: AppColor.gradient1),
                  ),
                  SizedBox(
                    width: w(25),
                  ),
                ],
              ),
              SizedBox(
                height: h(20),
              ),
              Container(
                height: h(200),
                width: w(330),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300].withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 6,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      height: h(94),
                      width: 330,
                      child: Column(
                        children: [
                          // SizedBox(height: h(10),),

                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: w(10),
                              ),
                              Container(
                                height: h(20),
                                width: w(57),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                    color: AppColor.button),
                                child: Center(
                                    child: Text(
                                  "New",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColor.homecard,
                                      fontFamily: 'SFPRO'),
                                )),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Dec 25",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColor.homecard,
                                    fontFamily: 'SFPRO'),
                              ),
                              SizedBox(
                                width: w(10),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: w(10),
                              ),
                              Text(
                                "Electricity bill is due 13th of january 2021.",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'SFPRO',
                                    color: AppColor.homecard),
                              ),
                            ],
                          ),
                          //                           SizedBox(height: w(10),),
                          //                           // SizedBox(height: w(10),),
                          //  Divider(height: h(1),

                          //  )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}

Widget homeCard(String image, String text) {
  return Container(
    height: h(105),
    width: w(160),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(image),
          Text(
            text,
            style: TextStyle(
                color: AppColor.homecard, fontSize: 16.sp, fontFamily: 'SFPRO'),
          )
        ],
      ),
    ),
  );
}
