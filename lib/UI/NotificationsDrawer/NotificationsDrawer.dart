import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freemium/Core/Consts.dart';


class NotificationsDrawer extends StatefulWidget {
  NotificationsDrawer({Key key}) : super(key: key);

  @override
  _NotificationsDrawerState createState() => _NotificationsDrawerState();
}

class _NotificationsDrawerState extends State<NotificationsDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
          elevation: 200,
          child: Container(
            color: Colors.white,
            child: ListView(
              children: [
                SizedBox(
                  height: h(30),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: w(15),
                    ),
             
                          Container(
                  color: Colors.white,
                  child: Container(
                    child: Text(
                      'Notifications',
                      style: TextStyle(color: AppColor.button, fontSize: 20.sp,fontFamily: 'SFPRO'),
                    ),
                   
                  ),
                ),
                SizedBox(width: w(100),),
                       Padding(
                         padding:  EdgeInsets.only(bottom:8.0),
                         child: IconButton(
                      icon: Icon(
                          Icons.close,
                          size: 40,
                          color: Colors.grey[400],
                      ),
                      onPressed: () =>  Navigator.of(context).pop()   
                    ),
                       ),
                  ],
                ),
                    SizedBox(height: h(20),),
                    Container(
                  height: h(700),
                  width: w(330),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    
                    
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
                                      color: AppColor.homecard,fontFamily: 'SFPRO'
                                    ),
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
                                      fontSize: 14.sp, color: AppColor.homecard,fontFamily: 'SFPRO'),
                                ),
                                SizedBox(
                                  width: w(10),
                                ),
                              ],
                            ),
                            SizedBox(height: h(10),),
                            Row(
                              children: [
                                SizedBox(
                                  width: w(10),
                                ),
                                Text(
                                  "Electricity bill is due 13th of january 2021.",
                                  style: TextStyle(
                                      fontSize: 14.sp,fontFamily: 'SFPRO',
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
          )),
    );
    
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}