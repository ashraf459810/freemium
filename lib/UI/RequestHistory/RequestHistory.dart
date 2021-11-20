import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemium/Model/RequestHistory/RequestHistory.dart';
import 'package:freemium/UI/RequestHistory/bloc/ordershistory_bloc.dart';

import 'package:freemium/UI/Widgets/Widgets.dart';

class RequestHistory extends StatefulWidget {
  RequestHistory({Key key}) : super(key: key);

  @override
  _RequestHistoryState createState() => _RequestHistoryState();
}

class _RequestHistoryState extends State<RequestHistory> {
  ReusableWidgets reusableWidgets = ReusableWidgets();
  List<Order> orders = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdershistoryBloc()..add(GetRequestHistoryEvent()),
      child: Scaffold(
          appBar: reusableWidgets.appbar(context, "Request History"),
          body: Container(
              color: Colors.white,
              child: Column(children: [
                Container(
                  color: Colors.grey[200],
                  height: 1,
                ),
                SizedBox(
                  height: h(26.5),
                ),
                BlocBuilder<OrdershistoryBloc, OrdershistoryState>(
                    builder: (context, state) {
                  if (state is Loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is Error) {
                    return Center(
                      child: Text(state.error),
                    );
                  }
                  if (state is GetRequestHistoryState) {
                    orders = state.requestHistory.orders;
                  }
                  return orders.isNotEmpty
                      ? Container(
                          height: h(560),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: orders.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: h(10),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: w(29),
                                      ),
                                      Container(
                                        width: w(100),
                                        child: Text("f${orders[index].service}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                                fontFamily: "SFPRO")),
                                      ),
                                      SizedBox(
                                        width: w(157.7),
                                      ),
                                      SvgPicture.asset(
                                        "assets/images/Path 29.svg",
                                        width: w(24),
                                        height: h(25),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: h(5),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: w(30),
                                      ),
                                      Text("#${orders[index].id}",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16.sp,
                                              fontFamily: "SFPRO")),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: w(30),
                                      ),
                                      Text(
                                          "Date : ${orders[index].createdAt.year}-${orders[index].createdAt.month}-${orders[index].createdAt.day}",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16.sp,
                                              fontFamily: "SFPRO")),
                                    ],
                                  ),
                                  SizedBox(
                                    height: h(8),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: w(30),
                                      ),
                                      Text("Total",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "SFPRO")),
                                      SizedBox(
                                        width: w(220.7),
                                      ),
                                      Text("${orders[index].price} IQD",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              fontFamily: "SFPRO")),
                                    ],
                                  ),
                                  SizedBox(
                                    height: h(14),
                                  ),
                                  Container(
                                    color: Colors.grey[300],
                                    height: 1,
                                    width: w(350),
                                  )
                                ],
                              );
                            },
                          ))
                      : Container();
                })
              ]))),
    );
  }
}

double h(double h) {
  return ScreenUtil().setHeight(h);
}

double w(double w) {
  return ScreenUtil().setWidth(w);
}
