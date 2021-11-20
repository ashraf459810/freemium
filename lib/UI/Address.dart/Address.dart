import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemium/Core/Consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freemium/Model/Communities/Communities.dart';
import 'package:freemium/UI/Address&Map/AddressMap.dart';
import 'package:freemium/UI/Home/Home.dart';
import 'package:freemium/UI/Registeration/bloc/signup_bloc.dart';
import 'package:freemium/UI/Widgets%20copy/Container.dart';
import 'package:freemium/UI/Widgets%20copy/Dropdown.dart';
import 'package:freemium/UI/Widgets/Widgets.dart';
import 'package:freemium/UI/Address&Map/GetLocationBloc/getloation_bloc.dart';
import 'package:freemium/injection.dart';

import 'package:toast/toast.dart';

class Address extends StatefulWidget {
  Address({Key key}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  List<Building> buildings = [];
  List<String> floors = [];
  List<String> apartments = [];
  final bloc = sl<GetloationBloc>();
  List<CommunityElement> community = [];
  String coummuityname;
  @override
  void initState() {
    context.read<SignupBloc>().add(GetCommunitiesEvent());
    bloc.add(LocationEvent());

    super.initState();
  }

  ReusableWidgets reusableWidgets = ReusableWidgets();
  TextEditingController buildingcontroller = TextEditingController();
  TextEditingController aptcontroller = TextEditingController();
  TextEditingController floorcontroller = TextEditingController();
  String building;
  String floor;
  String apartment;
  String aptbuildingid;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: reusableWidgets.appbar(context, "Address")),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: h(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: h(156),
                      width: w(136),
                      child: SvgPicture.asset("assets/images/Group 29.svg")),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddressMap(),
                      ));
                    },
                    child: SizedBox(
                        height: h(156),
                        width: w(136),
                        child: SvgPicture.asset("assets/images/Group 30.svg")),
                  ),
                ],
              ),
              SizedBox(
                height: h(63),
              ),
              BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  if (state is GetCommunitiesState) {
                    community = state.community.communities;
                  }
                  return container(
                      hight: h(45),
                      width: w(330),
                      color: AppColor.container,
                      borderRadius: 5,
                      child: DropDown(
                        list: community,
                        chosenvalue: coummuityname,
                        hint: "select community",
                        onchanged: (value) {
                          coummuityname = value.name;
                          width = w(380);
                        },
                        getindex: (index) {
                          buildings = community[index].buildings;

                          setState(() {});
                        },
                      ));
                },
              ),
              SizedBox(
                height: h(25),
              ),
              AnimatedContainer(
                width: width,
                height: h(200),
                duration: Duration(
                  seconds: 1,
                ),
                transformAlignment: AlignmentGeometry.lerp(
                    Alignment.bottomCenter, Alignment.centerLeft, 2),
                curve: Curves.decelerate,
                child: Column(
                  children: [
                    container(
                        hight: h(45),
                        width: w(330),
                        color: AppColor.container,
                        borderRadius: 5,
                        child: DropDown(
                          list: buildings,
                          chosenvalue: building,
                          hint: "select building",
                          onchanged: (value) {
                            building = value.name;
                            aptbuildingid = value.id.toString();
                          },
                          getindex: (index) {
                            floors = getfloors(buildings[index].numFloor);

                            apartments =
                                getapartments(buildings[index].numFloor);
                            setState(() {});
                          },
                        )),
                    SizedBox(
                      height: h(25),
                    ),
                    container(
                        hight: h(45),
                        width: w(330),
                        color: AppColor.container,
                        borderRadius: 5,
                        child: DropDown(
                          list: floors,
                          chosenvalue: floor,
                          hint: "select floor",
                          onchanged: (value) {
                            print(value);
                            floor = value;
                          },
                          getindex: (value) {},
                        )),
                    SizedBox(
                      height: h(25),
                    ),
                    container(
                        hight: h(45),
                        width: w(330),
                        color: AppColor.container,
                        borderRadius: 5,
                        child: DropDown(
                          list: apartments,
                          chosenvalue: apartment,
                          hint: "select apartment",
                          onchanged: (value) {
                            print(value);
                            apartment = value;
                          },
                          getindex: (value) {},
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: h(50),
              ),
              Container(
                  height: ScreenUtil().setHeight(44),
                  width: ScreenUtil().setWidth(44),
                  child: reusableWidgets.dots(
                      Colors.grey[400], Colors.grey[400], AppColor.button)),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              GestureDetector(
                  onTap: () {
                    context.read<SignupBloc>().add(GetSignUpEvent(
                          apartment,
                          floor,
                          aptbuildingid,
                        ));
                  },
                  child: BlocConsumer<SignupBloc, SignupState>(
                    listener: (context, state) {
                      if (state is GetCommunitiesState) {
                        community = state.community.communities;
                      }
                      if (state is GetSignUpState) {
                        Toast.show(
                          "Registered Successfully",
                          context,
                          gravity: 100,
                          backgroundColor: AppColor.gradient2,
                          duration: 2,
                        );
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                      }
                      if (state is GetError) {
                        Toast.show(
                          state.error,
                          context,
                          gravity: 100,
                          backgroundColor: AppColor.gradient2,
                          duration: 2,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is GetLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return reusableWidgets.submitbutton(
                          "Next", AppColor.button);
                    },
                  )),
            ],
          ),
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

  List<String> getfloors(int total) {
    for (var i = 0; i < buildings[0].numFloor; i++) {
      floors.add("$i");
    }
    return floors;
  }

  List<String> getapartments(int total) {
    for (var i = 0; i < buildings[0].numApartments; i++) {
      apartments.add("$i");
    }
    return apartments;
  }
}
